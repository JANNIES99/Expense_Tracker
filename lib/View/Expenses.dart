import 'package:expensetracker/Service/Database_Service.dart';
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
  final DatabaseService _databaseService = DatabaseService.instance;
  @override
  void initState() {
    addAllExpense();
    super.initState();
  }

  final List<Expense> registeredExpense = [];

  void addAllExpense() async {
    List<Expense> allExp = await _databaseService.getAllExpense();
    setState(() {
      for (final exp in allExp) {
        registeredExpense.add(exp);
      }
    });
  }

  void addExpense(Expense exp) {
    setState(() {
      registeredExpense.add(exp);
      _databaseService.addToExpense(exp);
    });
  }

  void removeExpense(Expense exp) {
    _databaseService.removeFromExpense(exp);
    setState(
      () {
        registeredExpense.remove(exp);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
      body: width <= 600
          ? Column(
              children: [
                Chart(expenses: registeredExpense),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: registeredExpense)),
                Expanded(child: mainContent),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext ctx) {
              return NewExpense(
                addExpense: addExpense,
              );
            },
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
