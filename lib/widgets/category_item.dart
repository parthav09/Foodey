import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodeyy/screen/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  void _selectcategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title':title,
    });
//    Navigator.push(
//      ctx,
//      CupertinoPageRoute(
//        builder: (_) => CategoryMealsScreen(title: title,id: id,),
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectcategory(context),
      splashColor: Colors.blue,
      highlightColor: Colors.pink,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.9),
                color.withOpacity(1),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
