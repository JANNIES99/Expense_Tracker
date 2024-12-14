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

  Future<Database> getDataBase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "Expense_db.db");
    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE EXPENSE(ID TEXT PRIMARY KEY,TITLE TEXT,AMOUNT REAL,DATE TEXT,CATEGORY TEXT)');
      },
    );
    return database;
  }
}
