import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodeyy/models/meal.dart';
import 'package:foodeyy/screen/meal_recipe.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.affordability,
      @required this.complexity,
      @required this.title,
      @required this.duration,
      @required this.imageUrl,
      @required this.id});

  String get complexitytext {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Difficult';
        break;
      default:
        return 'unknown';
    }
  }

  String get affordabilitytext {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxury Item';
        break;
      default:
        return 'unknown';
    }
  }

  void recipepgrt(BuildContext context) {
    Navigator.pushNamed(context, Recipes.routeName,arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>recipepgrt(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Text("|"),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$complexitytext'),
                    ],
                  ),
                  Text("|"),
                  Row(
                    children: <Widget>[
                      Icon(Icons.account_balance_wallet),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$affordabilitytext'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
