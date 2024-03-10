import 'package:flutter/material.dart';
import '../home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.teal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
