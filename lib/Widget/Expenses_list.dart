import 'package:expensetracker/Widget/Expense_List/Expense_Item.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expensesList, required this.removeExpense});
  final void Function(Expense) removeExpense;
  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    int leng = expensesList.length;
    return ListView.builder(
      itemCount: leng,
      itemBuilder: (ctx, index) {
        return Dismissible(
            background: Container(
              margin: Theme.of(context).cardTheme.margin,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            onDismissed: (direction) {
              removeExpense(expensesList[index]);
            },
            key: ValueKey(expensesList[index]),
            child: ExpenseItem(expense: expensesList[index]));
      },
    );
  }
}
