import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'provider/challenges_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WonChallenges(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Challenge App',
        home: HomePage(),
      ),
    );
  }
}
