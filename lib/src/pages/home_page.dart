import 'package:crud_productos/src/bloc/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    final body = Container();

    Widget appBar = AppBar(title: Text('Homa page'));
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: _makeButton(context),
    );
  }
}

Widget _makeButton(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: Color(0xfff7892b),
    child: Icon(Icons.add),
    onPressed: () => Navigator.pushNamed(context, 'product'),
  );
}
