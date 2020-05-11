import 'package:flutter/cupertino.dart';
import 'package:foodeyy/models/meal.dart';
import 'package:foodeyy/widgets/meal_item.dart';


class FavouriteScreen extends StatelessWidget {
  final List<Meal> myFav;
  FavouriteScreen(this.myFav);
  @override
  Widget build(BuildContext context) {
    if (myFav.isEmpty){
      return Center(child: Text("You have no favourites!! You need to add some"),);
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: myFav[index].id,
            title: myFav[index].title,
            affordability:myFav[index].affordability,
            complexity: myFav[index].complexity,
            duration: myFav[index].duration,
            imageUrl: myFav[index].imageUrl,
          );
        },
        itemCount: myFav.length,
      );
    }
  }
}
