import 'package:crud_productos/src/bloc/provider.dart';
import 'package:crud_productos/src/models/product_model.dart';
import 'package:crud_productos/src/providers/product_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final productProvider = ProductsProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    Widget appBar = AppBar(title: Text('Home page'));
    return Scaffold(
      appBar: appBar,
      body: _makeList(),
      floatingActionButton: _makeButton(context),
    );
  }

  Widget _makeButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xfff7892b),
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'product'),
    );
  }

  Widget _makeList() {
    return FutureBuilder(
      future: productProvider.loadProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (!snapshot.hasData) {
          return Container();
        } else {
          return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Color(0xfff7892b)));
        }
      },
    );
  }
}
