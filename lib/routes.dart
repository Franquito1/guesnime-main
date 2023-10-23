import 'package:flutter/material.dart';
import 'package:guesnime/HomePage.dart';
import 'package:guesnime/LoginPage.dart';
import 'package:guesnime/RegisterPage.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (BuildContext context) => RegisterPage(),
    '/login': (BuildContext context) => LoginPage(),
    '/home': (BuildContext context) => HomePage(),
    
    
  };
}