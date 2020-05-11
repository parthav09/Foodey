import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodeyy/dummy_data.dart';

class Recipes extends StatelessWidget {
static const routeName ='/meal-recipes';

final Function toggleFav;
final Function isFavorite;

Recipes(this.toggleFav,this.isFavorite);


  @override
  Widget build(BuildContext context) {
    Widget buildcontainer(
        BuildContext context, String text, PreferredSizeWidget appbar) {
      return Container(
        height: (MediaQuery.of(context).size.height -
                appbar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.03,
//            margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    final PreferredSizeWidget appbar = AppBar(
      title: Text('${selectedmeal.title}'),
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              width: double.infinity,
              child: Image.network(
                selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildcontainer(context, "Ingredients", appbar),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.2,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Colors.orangeAccent,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          selectedmeal.ingredients[index],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                  itemCount: selectedmeal.ingredients.length,
                ),
              ),
            ),
            buildcontainer(context, "Steps to follow", appbar),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(selectedmeal.steps[index]),
                    ),
                    Divider(),
                  ]);
                },
                itemCount: selectedmeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFav(mealId),
      ),
    );
  }
}
