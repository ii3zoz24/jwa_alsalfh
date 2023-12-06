import 'package:flutter/material.dart';

import '../categore_item.dart';
import '../items/categories_data.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400],
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Center(
          child: Text(
            'جوا السالفة',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'ElMessiri',
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: Categories_data.map(
          (categoryData) => CategoryItem(
            title: categoryData.title,
            imageUrl: categoryData.imageUrl,
            id: categoryData.id,
          ),
        ).toList(),
      ),
    );
  }
}
