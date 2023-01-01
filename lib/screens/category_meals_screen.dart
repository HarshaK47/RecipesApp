import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryID;
  String? categoryName;
  List<Meal> displayedMeals=[];
  var loadedinit = false;

  @override
  void initState(){
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!loadedinit){

    
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    categoryID = routeArgs['id'];
    categoryName = routeArgs['title'];
    displayedMeals = widget.availableMeals.where((meal){
      return meal.categories.contains(categoryID);
    }).toList();
    loadedinit = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String id){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(

      appBar: AppBar(
        title:  Text(categoryName.toString()),
      ),
      body: ListView(children: <Widget>[
        ...(displayedMeals.map((meal){
          return (MealItem(meal.id,meal.title,meal.imageUrl,meal.complexity,meal.affordability,meal.duration,));
        })).toList(),
      ],)
    );
  }
}