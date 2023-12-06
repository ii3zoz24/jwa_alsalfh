import 'package:flutter/material.dart';
import 'package:jwa_alsalfh/screens/pra_screen.dart';
import 'package:provider/provider.dart';

import '../items/list_provider.dart';
// import '../widgets/task_list.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class PlayersScreen extends StatelessWidget {
  static const screenRout = '/player-page';

  @override
  Widget build(BuildContext context) {
    final Map gameId = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text(
          'قائمة اللاعبيين',
          style: TextStyle(fontFamily: 'ElMessiri'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen((newTaskTitle) {
                  // setState(() {
                  //   tasks.add(Task(name: newTaskTitle));
                  //   Navigator.pop(context);
                  // });
                }),
              ),
            ),
          );
        },
        backgroundColor: Colors.indigo[400],
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    final listProvider =
                        Provider.of<ListProvider>(context, listen: false);

                    if (listProvider.tasks.length >= 3) {
                      Navigator.of(context).pushReplacementNamed(
                        PraScreen
                            .screenRout, // Assuming this is the correct route name
                        arguments: {
                          'id': gameId['id'],
                          'title': gameId['title'],
                          'kind': gameId['kind'],
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Center(
                            child: Text(
                                'عدد اللاعبين لازم يكون ثلاث لاعبين او اكثر'),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('طيب'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Icon(
                    Icons.play_arrow,
                    size: 40,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            Text(
              '${Provider.of<ListProvider>(context).tasks.length} عدد اللاعبين',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
