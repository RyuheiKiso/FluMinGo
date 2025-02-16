import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// SQLiteヘルパー
class SQLiteHelper {
  static final SQLiteHelper _instance = SQLiteHelper._internal();
  factory SQLiteHelper() => _instance;

  SQLiteHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // データベースの初期化処理をここに記述
      },
    );
  }
}