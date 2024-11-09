import 'dart:developer';

import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/View/Expenses.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({required this.addExpense, super.key});
  final void Function(Expense expense) addExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedData;
  Category _selectedCategory = Category.leisure;

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(
      () {
        _selectedData = pickedDate;
      },
    );
  }

  void _ckeckData() {
    final amount = double.tryParse(_amountController.text.trim());
    final title = _titleController.text.trim();
    if (title.isEmpty ||
        amount == null ||
        amount == 0 ||
        _selectedData == null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text(
                    "Plase make sure you have valid title, amount, date and category that was entered"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Okay"),
                  )
                ],
              ));
      return;
    }
    Expense exp = Expense(
        title: title,
        amount: amount,
        date: _selectedData!,
        category: _selectedCategory);
    widget.addExpense(exp);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: const InputDecoration(
                      label: Text("Amount"), prefixText: "\$ "),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedData == null
                        ? "Select Date"
                        : formatter.format(_selectedData!)),
                    IconButton(
                        onPressed: _openDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(
                    () {
                      _selectedCategory = value;
                      print(_selectedCategory);
                    },
                  );
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _ckeckData,
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
