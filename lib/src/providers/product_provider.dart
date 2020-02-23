import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_productos/src/models/product_model.dart';
import 'package:http/http.dart' as Http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class ProductsProvider {
  final databaseReference = Firestore.instance.collection("users");

  Future<bool> createProduct(ProductModel product) async {
    await databaseReference.add(product.toJson());

    return true;
  }

  Future<bool> updateProduct(ProductModel product) async {
    await databaseReference.document(product.id).updateData(product.toJson());

    return true;
  }

  Future<List<ProductModel>> loadProducts() async {
    final List<ProductModel> products = List();

    await databaseReference.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((DocumentSnapshot doc) {
        final ProductModel productTemp = ProductModel.fromJson(doc.data);
        productTemp.id = doc.documentID;
        products.add(productTemp);
      });
    });

    return products;
  }

  Future<int> deleteProduct(String doc) async {
    await databaseReference.document(doc).delete();
    return 1;
  }

  Future<String> uploadImage(File image) async {
    final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/dkmukytvf/image/upload?upload_preset=ikjt8vhn");
    final mimeType = mime(image.path).split('/');
    final imageUploadRequest = Http.MultipartRequest('POST', url);
    final file = await Http.MultipartFile.fromPath('file', image.path,
        contentType: MediaType(mimeType[0], mimeType[1]));
    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await Http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo esta pailas');
      print(resp.body);
      return null;
    }

    final responseData = json.decode(resp.body);

    return responseData['secure_url'];
  }
}
