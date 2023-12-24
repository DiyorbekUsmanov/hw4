// database_helper.dart
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'favourite_city_model.dart'; // Replace with the correct import path

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'favorite_cities.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorite_cities(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        location TEXT,
        time TEXT
      )
    ''');
  }

  Future<int> insertCity(FavoriteCity city) async {
    Database db = await database;
    return await db.insert('favorite_cities', city.toMap());
  }

  Future<List<Map<String, dynamic>>> getFavoriteCities() async {
    Database db = await database;
    return await db.query('favorite_cities');
  }
}
