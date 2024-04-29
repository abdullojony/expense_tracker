import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DataBase {
  Future<Database> getDataBase() async {
    final dataBasePath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(path.join(dataBasePath, 'expenses1.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE expenses (id INTEGER PRIMARY KEY, title TEXT, amount REAL, date TEXT, category TEXT)');
    }, version: 1);

    return db;
  }
}
