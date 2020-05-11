import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GridView(
          padding: const EdgeInsets.all(15),
          children: DUMMY_CATEGORIES
              .map(
                (catdata) =>
                CategoryItem(id: catdata.id,
                  title: catdata.title,
                  color: catdata.color,),
          )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      );
  }
}
