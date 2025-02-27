// 概要: SQLiteデータベースのヘルパー
// 目的: SQLiteデータベースの初期化とアクセスを管理する
// 使用方法: SQLiteHelper().database

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:logger/logger.dart';

// SQLiteヘルパー
class SQLiteHelper {
  static final SQLiteHelper _instance = SQLiteHelper._internal();
  factory SQLiteHelper() => _instance;

  SQLiteHelper._internal();

  Database? _database;
  final Logger _logger = Logger();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'app.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          // データベースの初期化処理をここに記述
        },
      );
    } catch (e, stackTrace) {
      _logger.e('Error initializing database', e, stackTrace);
      rethrow;
    }
  }
}
