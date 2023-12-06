import 'package:flutter/foundation.dart';

import 'dynamic_list.dart';

class ListProvider extends ChangeNotifier {
  List<DynamicList> tasks = [];

  void addTask(String newTaskTitle) {
    tasks.add(DynamicList(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(DynamicList task) {
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(DynamicList task) {
    tasks.remove(task);
    notifyListeners();
  }
}
