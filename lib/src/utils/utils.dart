import 'package:flutter/material.dart';

bool isNumeric(String value) {
  if (value.isEmpty) return false;
  final number = num.tryParse(value);
  return (number == null) ? false : true;
}

void showAlert(BuildContext context, String tittle, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(tittle),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
