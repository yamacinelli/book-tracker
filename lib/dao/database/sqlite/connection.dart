import 'dart:ui';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'script.dart';

class Connection {
  static late Database _database;
  static bool _closed = true;
  
  static Future<Database> create() async {
    if (_closed) {
      String databasePath = await getDatabasesPath();
      String path = join(databasePath, 'database.db');
      deleteDatabase(path);
      _database = await openDatabase(
          path,
          version: 1,
          onCreate: (Database database, int version) {
            // Create table book
            database.execute(createFavorite);
            // Run insert's into book table
            insertFavorite.forEach(database.execute);

            // Create table user
            database.execute(createUser);
        },
      );

      // Open database
      _closed = false;
    }
    return _database;
  }
}