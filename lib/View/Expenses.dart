import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Expense> _registeredExpense = [
    Expense(
      title: "Flutter",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Hotdog",
      amount: 9.99,
      date: DateTime.now(),
      category: Category.food,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}
