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
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 15, 131, 214));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: _scheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: _scheme.onPrimaryContainer,
          foregroundColor: _scheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: _scheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
        ),
      ),
      home: const App(),
    );
  }
}
