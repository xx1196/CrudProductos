import 'package:crud_productos/src/bloc/provider.dart';
import 'package:crud_productos/src/pages/home_page.dart';
import 'package:crud_productos/src/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage()
      },
      theme: ThemeData(
        primaryColor: Colors.orange
      ),
    );

    return Provider(child: materialApp);
  }
}
