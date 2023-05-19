import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._getInstance();

  static Database? _database;

  // Private constractor
  DatabaseHelper._getInstance();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'questions.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT NOT NULL,
        answerA TEXT NOT NULL,
        answerB TEXT NOT NULL,
        answerC TEXT NOT NULL,
        answerD TEXT NOT NULL,
        correctAnswer TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertQuestion(Map<String, dynamic> question) async {
    final Database db = await instance.database;
    return await db.insert('Questions', question);
  }

  Future<List<Map<String, dynamic>>> getAllQuestions() async {
    final Database db = await instance.database;
    return await db.query('Questions');
  }

  Future<int> deleteQuestion(int id) async {
    final Database db = await instance.database;
    return await db.delete('Questions', where: 'id = ?', whereArgs: [id]);
  }
}
