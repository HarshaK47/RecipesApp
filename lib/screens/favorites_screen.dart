import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  
  static const routeName = '/favourite-meals';
  final List favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.length==0){
      return Center(child: Text("You have no favourite meals yet!!", style: TextStyle(fontSize: 20),));
    }
    else{
      return ListView(children: <Widget>[
        ...(favouriteMeals.map((meal){
          return (MealItem(meal.id,meal.title,meal.imageUrl,meal.complexity,meal.affordability,meal.duration));
        })).toList(),
      ],);
    }
    
  }
}