import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_productos/src/models/product_model.dart';

class ProductsProvider {
  final String _url = "https://products-99367.firebaseio.com";
  final databaseReference = Firestore.instance.collection("users");

  Future<bool> createProduct(ProductModel product) async {
    await databaseReference.add(product.toJson());

    print(databaseReference.id);
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

    print(products[0].id);
    return products;
  }
}
