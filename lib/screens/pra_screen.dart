import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../items/categories_data.dart';
import '../items/list_provider.dart';

class PraScreen extends StatelessWidget {
  const PraScreen({super.key});
  static const screenRout = '/prascreen-page';
  @override
  Widget build(BuildContext context) {
    return NewWidget();
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
  });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

int numberName = 0;
int numberName2 = 0;
int numberName2plus1 = 1;
int numberAsk = 0;
int count = 0;
int numberClick = 1;
int firstClick = 0;
int randomNumber = 0;
int kindNumber = 0;
int countKind = 0;
int braAlsalgah = 0;
int AgaineTheGame = 1;
List<int> randomList = [];

List<int> generateRandomList(int length, int min, int max) {
  if (length > (max - min + 1)) {
    throw Exception(
        "Cannot generate a unique random list with given constraints.");
  }

  Random random = Random();
  Set<int> uniqueNumbers = Set<int>();
  List<int> resultList = [];

  while (uniqueNumbers.length < length) {
    int randomNumber = min + random.nextInt(max - min + 1);
    uniqueNumbers.add(randomNumber);
  }

  resultList.addAll(uniqueNumbers.toList());
  resultList.shuffle();

  return resultList;
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    //final selectedGame = Ask_Data.firstWhere((game) => game.id == gameId);
    final Map gameId = ModalRoute.of(context)?.settings.arguments as Map;
    final selectedGame = Ask_Data.firstWhere(
      (game) => game.id == gameId['id'],
    );

    int playersNumber = Provider.of<ListProvider>(context).tasks.length;

    String firstAsk =
        'مرر الجوال ل${Provider.of<ListProvider>(context).tasks[numberName].name}';
    String forthAsk =
        '${Provider.of<ListProvider>(context).tasks[numberName2].name} اسأل ${Provider.of<ListProvider>(context).tasks[numberName2plus1].name}';
    List<String> ask = [
      firstAsk,
      'انت جوا السالفة\nالسالفة هي ${selectedGame.kind[kindNumber]}',
      'انت برا السالفة',
      forthAsk,
      'الي برا السالفة هو...',
      'الي برا السالفة هو ${Provider.of<ListProvider>(context).tasks[braAlsalgah].name}'
    ];
    return Scaffold(
      backgroundColor: Colors.teal[400],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal[400],
        title: Center(
          child: Text(
            '${gameId['title']}',
            style: TextStyle(fontFamily: 'ElMessiri'),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
              child: Text(
                ask[numberAsk],
                style: TextStyle(
                  fontFamily: 'ElMessiri',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            onPressed: () {
              setState(() {
                if (randomList.length != selectedGame.kind.length ||
                    randomList.isEmpty) {
                  randomList = generateRandomList(selectedGame.kind.length, 0,
                      selectedGame.kind.length - 1);
                  //print(randomList.toString());
                }
                if (countKind == 0) {
                  kindNumber = randomList[countKind];
                  countKind++;
                }

                if (numberAsk == 5) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Center(child: Text('تبي تكمل؟')),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text('ايه')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            '/', (route) => false);
                                    //Navigator.pop(context);
                                  },
                                  child: Text('لا')),
                            ],
                          ));
                  if (countKind < randomList.length) {
                    kindNumber = randomList[countKind];
                    countKind++;
                  } else {
                    randomList = [];
                    countKind = 0;
                  }
                  numberName = -1;
                  numberName2 = 0;
                  numberName2plus1 = 1;
                  numberAsk = 0;
                  count = 0;
                  numberClick = 0;
                  firstClick = 0;
                  randomNumber = 0;
                  AgaineTheGame = 0;
                }
                if (count < (2 * playersNumber) - AgaineTheGame) {
                  if (randomNumber == 0) {
                    int braalsalfah = Random().nextInt(playersNumber) + 1;
                    randomNumber = braalsalfah;
                    braAlsalgah = randomNumber - 1;
                    print('the braa: $randomNumber');
                  }
                  numberClick++;
                  if (numberClick % 2 != 0) {
                    numberAsk = 0;
                    numberName = numberName + 1;
                  } else {
                    if (numberClick % 2 == 0 &&
                        numberName + 1 != randomNumber) {
                      numberAsk = 1;
                    }
                    if (numberClick % 2 == 0 &&
                        numberName + 1 == randomNumber) {
                      numberAsk = 2;
                    }
                  }
                  count++;
                } else if (numberName2 < playersNumber - 1) {
                  numberAsk = 3;
                  if (numberName2 + 1 >= playersNumber - 1) {
                    numberName2++;
                    numberName2plus1 = 0;
                  }
                  if (firstClick != 0 && numberName2 + 1 < playersNumber - 1) {
                    numberName2++;
                    numberName2plus1++;
                  } else {
                    firstClick = 1;
                  }
                } else {
                  numberName = 0;
                  numberClick = 0;

                  if (numberAsk >= 4) {
                    numberAsk = 5;
                  } else {
                    numberAsk = 4;
                  }
                }
              });
            },
            child: Text('التالي'),
          ),
        ],
      ),
    );
  }
}
