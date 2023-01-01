// import 'dart:ffi';

import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function saveFilters;
  

  final Map<String,bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters,);
  

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    glutenFree = widget.currentFilters['glutenfree'] as bool;
    vegetarian = widget.currentFilters['vegetarian'] as bool;
    vegan = widget.currentFilters['vegan'] as bool;
    lactoseFree = widget.currentFilters['lactosefree'] as bool;


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'glutenfree': glutenFree,
                  'vegetarian': vegetarian,
                  'vegan': vegan,
                  'lactosefree': lactoseFree,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Meal Selection",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              SwitchListTile(
                title: Text('Gluten Free'),
                subtitle: Text("Only includes Gluten Free meals"),
                value: glutenFree,
                onChanged: (bool value) {
                  setState(() {
                    glutenFree = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegetarian'),
                subtitle: Text("Only includes Vegetarian meals"),
                value: vegetarian,
                onChanged: (bool value) {
                  setState(() {
                    vegetarian = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegan'),
                subtitle: Text("Only includes Vegan meals"),
                value: vegan,
                onChanged: (bool value) {
                  setState(() {
                    vegan = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Lactose Free'),
                subtitle: Text("Only includes Lactose Free meals"),
                value: lactoseFree,
                onChanged: (bool value) {
                  setState(() {
                    lactoseFree = value;
                  });
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
