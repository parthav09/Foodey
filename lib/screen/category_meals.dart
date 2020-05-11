import 'package:flutter/material.dart';
import 'package:foodeyy/models/meal.dart';
import 'package:foodeyy/widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName='/categories-meal';
  final List<Meal> availablemeals;
  CategoryMealsScreen(this.availablemeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeargs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categorytitle=routeargs['title'];
    final categoryid=routeargs['id'];

    final categoryMeals = widget.availablemeals.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();

    print(categorytitle);
    print("category id" + categoryid);

    return Scaffold(
      appBar: AppBar(
        title: Text(" " + categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
