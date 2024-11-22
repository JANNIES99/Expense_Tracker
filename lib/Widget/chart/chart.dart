import 'package:expensetracker/Widget/chart/chart_bar.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<Expense> expenses;
  List<ExpensesBuilder> get exBuild {
    return [
      ExpensesBuilder.forCategorry(
          category: Category.leisure, allExpenses: expenses),
      ExpensesBuilder.forCategorry(
          category: Category.food, allExpenses: expenses),
      ExpensesBuilder.forCategorry(
          category: Category.travel, allExpenses: expenses),
      ExpensesBuilder.forCategorry(
          category: Category.work, allExpenses: expenses),
    ];
  }

  double get maxTotalAmount {
    double amount = 0;
    for (final build in exBuild) {
      if (build.totalExpense > amount) {
        amount = build.totalExpense;
      }
    }
    return amount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardTheme.color,
      ),
      margin: Theme.of(context).cardTheme.margin,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final build in exBuild)
                ChartBar(fill: build.totalExpense / maxTotalAmount),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(categoryIcon[Category.leisure]),
              Icon(categoryIcon[Category.food]),
              Icon(categoryIcon[Category.travel]),
              Icon(categoryIcon[Category.work]),
            ],
          ),
        ],
      ),
    );
  }
}
