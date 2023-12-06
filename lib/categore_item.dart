import 'package:flutter/material.dart';
import 'package:jwa_alsalfh/screens/players_screen.dart';
//import 'package:jwa_alsalfh/main.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.id});
  final String id;
  final String title;
  final String imageUrl;

  void select(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      PlayersScreen.screenRout,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => select(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'ElMessiri',
                fontSize: 30,
              ),
            ),
            //color: Colors.black.withOpacity(0.3), انقل اللون للبوكس ديكور عشان يزين
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
