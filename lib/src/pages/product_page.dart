import 'package:crud_productos/src/models/product_model.dart';
import 'package:crud_productos/src/providers/product_provider.dart';
import 'package:crud_productos/src/utils/utils.dart' as Utils;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ProductModel product = ProductModel();
  final productProvider = ProductsProvider();
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final ProductModel prodData = ModalRoute.of(context).settings.arguments;

    if (prodData != null) {
      product = prodData;
    }

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
      key: formKey,
      child: Column(
        children: <Widget>[
          _makeName(),
          _makePrice(),
          _makeAvailable(),
          _makeButton()
        ],
      ),
    );

    Widget body = SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: form,
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      body: body,
    );
  }

  Widget _makeName() {
    return TextFormField(
        initialValue: product.title,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: 'Producto'),
        onSaved: (value) => product.title = value,
        validator: (value) {
          return (value.length < 3) ? 'Ingrese el nombre del producto' : null;
        });
  }

  Widget _makePrice() {
    return TextFormField(
        initialValue: product.price.toString(),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(labelText: 'Producto'),
        onSaved: (value) => product.price = double.parse(value),
        validator: (value) {
          return (Utils.isNumeric(value))
              ? null
              : 'Por favor inserte solo números';
        });
  }

  Widget _makeButton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Color(0xfff7892b),
      icon: Icon(Icons.save),
      label: Text('Guardar'),
      onPressed: (_saving) ? null : _submit,
    );
  }

  Widget _makeAvailable() {
    return SwitchListTile(
      activeColor: Color(0xfff7892b),
      inactiveThumbColor: Color(0xfffbb448),
      inactiveTrackColor: Color(0xfffbb448),
      value: product.available,
      title: Text('Disponible'),
      onChanged: (value) => setState(() {
        product.available = value;
      }),
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();

    setState(() {
      _saving = true;
    });

    if (product.id == null) {
      productProvider.createProduct(product);
      showSnackBar('producto guardado');
    } else {
      productProvider.updateProduct(product);
      showSnackBar('producto modificado');
    }
    Navigator.pop(context);
  }

  void showSnackBar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1850),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
