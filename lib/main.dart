import 'package:flutter/material.dart';
import 'package:expensetracker/View/Expenses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ColorScheme _scheme =
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: _scheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.blue[800],
        ),
      ),
      home: const App(),
    );
  }
}
