import 'package:expensetracker/Widget/Expenses_list.dart';
import 'package:expensetracker/Widget/New_Expense.dart';
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
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext ctx) {
                  return const NewExpense();
                },
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
        title: const Text(
          "Flutter Expense Tracker",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(
            child: ExpensesList(
              expensesList: registeredExpense,
            ),
          ),
        ],
      ),
    );
  }
}
