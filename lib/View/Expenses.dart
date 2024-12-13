import 'package:expensetracker/Widget/Expenses_list.dart';
import 'package:expensetracker/Widget/New_Expense.dart';
import 'package:expensetracker/Widget/chart/chart.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Expense> registeredExpense = [
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
    ),
  ];

  void addExpense(Expense exp) {
    setState(() {
      registeredExpense.add(exp);
    });
  }

  void removeExpense(Expense exp) {
    final eIndex = registeredExpense.indexOf(exp);
    setState(
      () {
        registeredExpense.remove(exp);
      },
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense is deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              registeredExpense.insert(eIndex, exp);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No Expense found  Start adding some"),
    );
    if (registeredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expensesList: registeredExpense,
        removeExpense: removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Expense Tracker",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Chart(expenses: registeredExpense),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
