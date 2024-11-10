import 'package:expensetracker/Widget/Expense_List/Expense_Item.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expensesList});
  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    print(expensesList[1].title);
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
            key: ValueKey(expensesList[index]),
            child: ExpenseItem(expense: expensesList[index]));
      },
    );
  }
}
