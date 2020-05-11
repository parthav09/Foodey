import 'package:flutter/material.dart';
import 'package:foodeyy/models/meal.dart';
import 'package:foodeyy/screen/categories_screen.dart';
import 'package:foodeyy/screen/favourites.dart';
import 'package:foodeyy/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favourites;

  TabsScreen(this.favourites);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedpageindex = 0;

  void _selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Foodey',
      },
      {
        'page': FavouriteScreen(widget.favourites),
        'title': 'Favourites',
      }
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedpageindex]['title']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedpageindex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        onTap: _selectpage,
        backgroundColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: Icon(Icons.star),
              title: Text('Favourites')),
        ],
      ),
    );
  }
}

//Tab Bar at the top
//DefaultTabController(
//length: 2,
//child: Scaffold(
//appBar: AppBar(
//title: Text('Meals'),
//bottom: TabBar(tabs: <Widget>[
//Tab(icon: Icon(Icons.category),),
//Tab(icon: Icon(Icons.star),),
//]),
//),
//body: TabBarView(
//children: <Widget>[
//CategoriesScreen(),
//FavouriteScreen(),
//],
//),
//),
//);
