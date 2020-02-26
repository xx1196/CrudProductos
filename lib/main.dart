import 'package:crud_productos/src/bloc/provider.dart';
import 'package:crud_productos/src/pages/home_page.dart';
import 'package:crud_productos/src/pages/login_page.dart';
import 'package:crud_productos/src/pages/product_page.dart';
import 'package:crud_productos/src/pages/register_page.dart';
import 'package:crud_productos/src/utils/user_preferences.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'home': (BuildContext context) => HomePage(),
        'product': (BuildContext context) => ProductPage()
      },
      theme: ThemeData(primaryColor: Colors.orange),
    );

    return Provider(child: materialApp);
  }
}
