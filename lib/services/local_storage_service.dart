import 'package:noteapp/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoDataService {
  static const String _todoTasksKey = 'todo_tasks';

  Future<void> saveTodoTasks(List<TodoTask> todoTasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = todoTasks.map((task) => task.toJson()).toList();
    await prefs.setStringList(_todoTasksKey, jsonList.cast<String>());
  }

  Future<List<TodoTask>> loadTodoTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_todoTasksKey) ?? [];
    return jsonList
        .map((json) => TodoTask.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
