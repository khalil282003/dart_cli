import 'dart:io';

class TaskManager {
  final List<String> _tasks = [];

  void addTask(String task) {
    _tasks.add(task);
    print('Task added: $task');
  }

  void removeTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      print('Task removed: ${_tasks[index]}');
      _tasks.removeAt(index);
    } else {
      print('Invalid task index');
    }
  }

  void listTasks() {
    if (_tasks.isEmpty) {
      print('No tasks available');
    } else {
      print('Tasks:');
      for (var i = 0; i < _tasks.length; i++) {
        print('$i: ${_tasks[i]}');
      }
    }
  }
}

void main() {
  final manager = TaskManager();
  while (true) {
    print('\nEnter a command: [add/list/remove/exit]');
    String? input = stdin.readLineSync();

    if (input == null) continue;

    if (input.startsWith('add ')) {
      manager.addTask(input.substring(4));
    } else if (input == 'list') {
      manager.listTasks();
    } else if (input.startsWith('remove ')) {
      int index = int.tryParse(input.substring(7)) ?? -1;
      manager.removeTask(index);
    } else if (input == 'exit') {
      break;
    } else {
      print('Unknown command');
    }
  }
}
