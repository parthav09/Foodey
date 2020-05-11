import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodeyy/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function settingfilter;

  FilterScreen(this.settingfilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenfree = false;
  bool _isvegetarian = false;
  bool _isvegan = false;
  bool _lactosefree = false;

  Widget _buildfilteroptions(
      String text, bool val, String subtext, Function updatedvalue) {
    return SwitchListTile.adaptive(
      title: Text(text),
      value: val,
      subtitle: Text(subtext),
      onChanged: updatedvalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
             final selectedFilters={
               'gluten': _glutenfree,
               'lactose': _lactosefree,
               'vegan': _isvegan,
               'vegetarian': _isvegetarian,
             };
              widget.settingfilter(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildfilteroptions(
                  'Gluten free',
                  _glutenfree,
                  "filters only gluten free items",
                  (newvalue) {
                    setState(() {
                      _glutenfree = newvalue;
                    });
                  },
                ),
                _buildfilteroptions(
                  'Lactose free',
                  _lactosefree,
                  "filters only lactose free items",
                  (newvalue) {
                    setState(() {
                      _lactosefree = newvalue;
                    });
                  },
                ),
                _buildfilteroptions(
                  'Vegetarian',
                  _isvegetarian,
                  "filters only vegetarian items",
                  (newvalue) {
                    setState(() {
                      _isvegetarian = newvalue;
                    });
                  },
                ),
                _buildfilteroptions(
                  'Vegan',
                  _isvegan,
                  "filters only vegan items",
                  (newvalue) {
                    setState(() {
                      _isvegan = newvalue;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
