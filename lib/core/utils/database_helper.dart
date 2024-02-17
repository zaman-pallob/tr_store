import 'package:tr_store/core/app_database/app_database.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper = DatabaseHelper._internal();
  static AppDatabase? database;
  factory DatabaseHelper() {
    return _databaseHelper;
  }
  DatabaseHelper._internal();

  static initialize() {
    if (database == null) {
      database = AppDatabase();
    }
  }
}
