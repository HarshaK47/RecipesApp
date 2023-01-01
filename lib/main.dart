
import './screens/favorites_screen.dart';
import './screens/filters_screen.dart';

import './screens/tabs_screen.dart';
import './models/meal.dart';

import './screens/category_meals_screen.dart';

import './screens/categories_screen.dart';
import './screens/recipe.dart';
import 'package:flutter/material.dart';
import './dummy_data.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Map<String,bool> filters = {
    'glutenfree': false,
    'vegetarian': false,
    'vegan': false,
    'lactosefree': false,

  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void setFilters(Map<String,bool> filterData){
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal){
        // ....

        if(filters['glutenfree']==true && meal.isGlutenFree==false){
          return false;
        }
        if(filters['lactosefree']==true && meal.isLactoseFree==false){
          return false;
        }
        if(filters['vegetarian']==true && meal.isVegetarian==false){
          return false;
        }

        if(filters['vegan']==true && meal.isVegan==false){
          return false;
        }
        return true;




      }).toList();
    });
  }

  void toggleFavourite(String mealID){
    final existingIndex = favouriteMeals.indexWhere((meal) => meal.id == mealID);

    if(existingIndex!=-1){
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
      
    }

    else{
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealID));
      });
    }
  }

  bool isFavourite(String mealID){
    return favouriteMeals.any((element) => element.id == mealID);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Quicksand',
      ),
      
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(favouriteMeals),
        CategoryMealsScreen.routeName: (ctx)=>CategoryMealsScreen(availableMeals),
        Recipe.routeName: (ctx)=>Recipe(toggleFavourite,isFavourite),
        // FavouritesScreen.routeName: (ctx)=>FavouritesScreen(),
        FiltersScreen.routeName: (ctx)=>FiltersScreen(filters,setFilters),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: CategoriesScreen(),
    );
  }
}