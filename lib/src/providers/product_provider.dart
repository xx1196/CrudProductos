import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_productos/src/models/product_model.dart';

class ProductsProvider {
  final databaseReference = Firestore.instance.collection("users");

  Future<bool> createProduct(ProductModel product) async {
    await databaseReference.add(product.toJson());

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
}
