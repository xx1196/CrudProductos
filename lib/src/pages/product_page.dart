import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final actions = <Widget>[
      IconButton(
        icon: Icon(Icons.photo_size_select_actual),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.camera_alt),
        onPressed: () {},
      ),
    ];
    Widget appBar = AppBar(
      title: Text('Producto'),
      actions: actions,
    );

    Widget form = Form(
      child: Column(
        children: <Widget>[_makeName(), _makePrice(), _makeButton()],
      ),
    );

    Widget body = SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: form,
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}

Widget _makeName() {
  return TextField(
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(labelText: 'Producto'),
  );
}

Widget _makePrice() {
  return TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: 'Producto'),
  );
}

Widget _makeButton() {
  return RaisedButton.icon(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    color: Color(0xfff7892b),
    icon: Icon(Icons.save),
    label: Text('Guardar'),
    onPressed: () {},
  );
}
