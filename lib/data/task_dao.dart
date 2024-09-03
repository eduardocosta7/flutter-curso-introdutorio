import 'package:curso_flutter_introducao/data/database.dart';
import 'package:sqflite/sqflite.dart';

import '../components/task.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT,'
      '$_difficulty INTEGER,'
      '$_image TEXT,'
      '$_level INTEGER,'
      '$_progress)';

  static const String _tablename = 'task_table';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  static const String _level = 'level';
  static const String _progress = 'progress';

  save(Task task) async {
    final Database database = await getDatabase();
    var itemExists = await find(task.name);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      return await database.insert(
        _tablename,
        taskMap,
      );
    } else {
      return await database.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.name],
      );
    }
  }

  updateLevel(Task task) async {
    final Database database = await getDatabase();
    Map<String, dynamic> taskMap = toMap(task);
    database.update(
      _tablename,
      taskMap,
      where: '$_name = ?',
      whereArgs: [task.name],
    );
  }

  Future<List<Task>> findAll() async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);
    return toList(result);
  }

  Future<List<Task>> find(String taskName) async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
    return toList(result);
  }

  delete(String taskName) async {
    final Database database = await getDatabase();
    database.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> line in taskMap) {
      final Task task =
          Task(line[_name], line[_image], line[_difficulty], line[_level], line[_progress]);
      tasks.add(task);
    }
    return tasks;
  }

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> taskMap = {};
    taskMap[_name] = task.name;
    taskMap[_difficulty] = task.difficulty;
    taskMap[_image] = task.photo;
    taskMap[_level] = task.level;
    taskMap[_progress] = task.progress;
    return taskMap;
  }
}
