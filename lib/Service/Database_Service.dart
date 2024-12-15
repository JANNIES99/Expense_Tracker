import 'dart:collection';

import 'package:expensetracker/models/expense.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

DateFormat format = DateFormat('MM/dd/yyyy');

class DatabaseService {
  Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();
  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }
    _db = await getDataBase();
    return _db!;
  }

  final _tableName = "EXPENSE";

  Future<Database> getDataBase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "Expense_db.db");
    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $_tableName(ID TEXT PRIMARY KEY,TITLE TEXT,AMOUNT REAL,DATE TEXT,CATEGORY TEXT)');
      },
      version: 1,
    );
    return database;
  }

  void addToExpense(Expense exp) async {
    Map<String, Object> map = {
      "ID": exp.id,
      "TITLE": exp.title,
      "AMOUNT": exp.amount,
      "DATE": exp.formattedDate,
      "CATEGORY": exp.category.name.toUpperCase(),
    };
    final db = await database;
    db.insert(_tableName, map);
  }

  Future<List<Expense>> getAllExpense() async {
    final List<Expense> expList = [];
    final db = await database;
    final datas = await db.query(_tableName);
    for (final data in datas) {
      Category ctr = Category.food;
      if (Category.food.name.toUpperCase() == data["CATEGORY"]) {
        ctr = Category.food;
      }
      if (Category.leisure.name.toUpperCase() == data["CATEGORY"]) {
        ctr = Category.leisure;
      }
      if (Category.travel.name.toUpperCase() == data["CATEGORY"]) {
        ctr = Category.travel;
      }
      if (Category.work.name.toUpperCase() == data["CATEGORY"]) {
        ctr = Category.work;
      }
      Expense exp = Expense.fromDatabase(
          id: data["ID"] as String,
          title: data["TITLE"] as String,
          amount: data["AMOUNT"] as double,
          date: format.parse(data["DATE"] as String),
          category: ctr);
      expList.add(exp);
    }
    return expList;
  }
}
