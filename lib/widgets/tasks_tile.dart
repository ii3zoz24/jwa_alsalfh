import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxChange;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxChange,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontFamily: 'ElMessiri',
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          checkboxChange(isChecked);
        },
        icon: Icon(Icons.highlight_remove_outlined),
      ),
      /* Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked,
        onChanged: checkboxChange,
      ),*/
    );
  }
}
