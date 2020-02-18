import 'package:crud_productos/src/bloc/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Email: ${bloc.email}'),
        Divider(),
        Text('Password: ${bloc.password}'),
      ],
    );

    Widget appBar = AppBar(
      title: Text('Homa page')
    );
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
