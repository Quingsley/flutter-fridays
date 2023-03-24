import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
      title: 'BMI Calculator',
      home: const HomePage(),
      routes: {
        // routes table
        '/home': (context) => const HomePage(), // home page
        '/result': (context) => const BMIResult(), // result page
      },
    );
  }
}
