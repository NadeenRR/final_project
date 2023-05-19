import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._getInstance();
  

  // Private constractor
  DatabaseHelper._getInstance();


  // static  Database? _database;
   Database? _database;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final String path = join(await getDatabasesPath(), 'questions.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
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
    return await _database!.insert('Questions', question);
  }

  Future<List<Map<String, dynamic>>> getAllQuestions() async {
    return await _database!.query('Questions');
  }

  Future<int> deleteQuestion(int id) async {
    return await _database!.delete('Questions', where: 'id = ?', whereArgs: [id]);
  }
}
