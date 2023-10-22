import 'package:flutter/material.dart';
import 'package:guesnime/RegisterPage.dart';
import 'package:guesnime/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guesnime',
      theme: ThemeData(
        backgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: Routes.routes,
    );
  }
}