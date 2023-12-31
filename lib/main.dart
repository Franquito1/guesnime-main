import 'package:flutter/material.dart';
import 'package:guesnime/EstrellasProvider.dart';
import 'package:guesnime/NivelesExistososProvider.dart';
import 'package:guesnime/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StarsProvider()),
        ChangeNotifierProvider(create: (context) => NivelesExitososProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guesnime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //backgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: Routes.routes,
    );
  }
}