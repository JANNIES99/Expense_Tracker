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
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 36, 59, 233));
  final ColorScheme _darkscheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 31, 2, 253),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: _darkscheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: _darkscheme.onPrimaryContainer,
          foregroundColor: _darkscheme.primaryContainer,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: _darkscheme.secondaryContainer,
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          color: _darkscheme.onSecondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _darkscheme.primaryContainer,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.black,
          ),
          titleSmall: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: Colors.black,
          ),
          bodyMedium: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: _scheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: _scheme.onPrimaryContainer,
          foregroundColor: _scheme.primaryContainer,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: _scheme.secondaryContainer,
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          color: _scheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _scheme.primaryContainer,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.black,
          ),
          titleSmall: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: Colors.black,
          ),
          bodyMedium: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const App(),
    );
  }
}
