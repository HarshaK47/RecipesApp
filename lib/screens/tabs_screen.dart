

import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabScreen extends StatefulWidget {
  final List favouriteMeals;
  TabScreen(this.favouriteMeals);
  

  @override
  State<TabScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabScreen> {
   List<Map<String, dynamic>> pages=[]; 

  int selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    pages = [
    {'page': CategoriesScreen(), 'title': 'All Categories Meals'},
    {'page': FavouritesScreen(widget.favouriteMeals), 'title': 'My Favourite Meals'},
  ];

    super.initState();
  }


  void selectPage(int index){
    setState((){
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.category), 
          label: "Categories",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.star), 
          label: "Favourites",
          ),


        ],

      ),
    );
  }
}