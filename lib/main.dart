import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodeyy/screen/category_meals.dart';
import 'package:foodeyy/screen/filters.dart';
import 'package:foodeyy/screen/meal_recipe.dart';
import 'package:foodeyy/screen/tabs_screen.dart';
import 'dummy_data.dart';
import 'package:foodeyy/models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
//class _MyAppState extends State<MyApp> {
//
//  @override
//  _MyAppState createState() => _MyAppState();
//}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availmeals = DUMMY_MEALS;
  List<Meal> _favouritedmeals = [];

  void _setfilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;

      _availmeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }


  void _toggleFav(String mealId) {
    final existingIndex =
    _favouritedmeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex>=0){
      setState(() {
        _favouritedmeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favouritedmeals.add(DUMMY_MEALS.firstWhere((meal){
          return meal.id == mealId;
        }));
      });
    }
  }

  bool _isFav(String id){
    return _favouritedmeals.any((meal){
      return meal.id == id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodey',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.pinkAccent,
        canvasColor: Color.fromRGBO(225, 225, 225, 1),
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
//      home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouritedmeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availmeals),
        Recipes.routeName: (ctx) => Recipes(_toggleFav,_isFav),
        FilterScreen.routeName: (ctx) => FilterScreen(_setfilters),
      },
      debugShowCheckedModeBanner: false,

//      onGenerateRoute: (settings){
//        return CupertinoPageRoute(builder: (ctx) => CategoriesScreen(),);
//      },
//      onUnknownRoute: ,
    );
  }
}

//
//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Foodey'),
//      ),
//      body: Center(
//        child: Text('Navigation Time!'),
//      ),
//    );
//  }
//}
