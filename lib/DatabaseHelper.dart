import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'Task.dart';
import 'package:path/path.dart';

final String tableTodo = 'Todo';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnDone = 'done';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database _database;

  DatabaseHelper._init();
  Future<Database> get database async {
    print('database getter called');
    if (_database != null) return _database;
    {
      _database = await initDB();

      return _database;
    }
  }

  Future<Database> initDB() async {
    try {
      final path = await getDatabasesPath();
      return await openDatabase(join(path, 'task.db'), version: 1,
          onCreate: (Database db, int version) async {
        print('Creating task table');
        await db.execute(
          "CREATE TABLE Todo("
          "$columnId INTEGER PRIMARY KEY AUTOINCREMENT,"
          "$columnTitle TEXT NOT NULL,"
          "$columnDone INTEGER "
          ")",
        );
      });
    } catch (e) {
      print('Error:$e');
    }
  }

  Future<List<Task>> getAllTasks() async {
    final mydb = await database;

    List<Map> results = await mydb.rawQuery('SELECT * FROM Todo');
    List<Task> tasks = List<Task>();
    results.forEach((results) {
      Task task = Task.fromMap(results);
      tasks.add(task);
      // print('tasks');
    });
    return tasks;
  }

  Future<Task> insert(Task task) async {
    task.id = await _database.insert(tableTodo, task.toMap());
    return task;
  }

  Future<Task> getTask(int id) async {
    List<Map> maps = await _database.query(tableTodo,
        columns: [columnId, columnTitle, columnDone],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Task.fromMap(maps.first);
    }
    return null;
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    print('Task deleted');
    return await db.delete('Todo', where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateTask(Task task) async {
    return await _database.update(tableTodo, task.toMap(),
        where: '$columnId = ?', whereArgs: [task.id]);
  }

  Future close() async => _database.close();
}
