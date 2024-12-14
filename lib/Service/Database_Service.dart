import 'dart:collection';

import 'package:expensetracker/models/expense.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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

  void getAllExpense() async {
    final db = await database;
    final data = await db.query(_tableName);
    print(data);
  }
}
