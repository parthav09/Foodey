import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:foodeyy/screen/filters.dart';
import 'package:foodeyy/screen/tabs_screen.dart';


class MainDrawer extends StatelessWidget {





  Widget buildlistile(String titles,IconData icn, Function taphandler){
    return ListTile(
      leading: Icon(
        icn,
        size: 26,
      ),
      title: Text(
        titles,
        style: TextStyle(
            fontFamily: 'RobotoCOndensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: taphandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.amber,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking up",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.brown),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildlistile('Meals', Icons.restaurant,(){
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildlistile('Settings', Icons.settings,(){
            Navigator.pushReplacementNamed(context, FilterScreen.routeName);
          }),

        ],
      ),
    );
  }
}
