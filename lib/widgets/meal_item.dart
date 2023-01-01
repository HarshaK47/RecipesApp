import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/recipe.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  // final Function removeItem;


  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;
      
      default:
        return 'Unknown';
        break;

    }
  } 


  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;
      
      default:
        return 'Unknown';
        break;

    }
  }

  MealItem(
      this.id, this.title, this.imageUrl, this.complexity, this.affordability, this.duration);

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Recipe.routeName,
    arguments: {
      'id': id,
      'title': title
    }
    ).then((result){
      if(result != null){
        // removeItem(result);
      }
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[


                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 300,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      
                    ),),
                      
                      
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                      child: Text(
                        title, style: TextStyle(
                          
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      
                       ),
                    ),
                  ),


                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 4,),
                    Text("${duration} minutes"),
                  ],),

                  Row(children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 4,),
                    Text(complexityText),
                  ],),

                  Row(children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 4,),
                    Text(affordabilityText),
                  ],),
                  


                ],),
              ),


            ],
          )),
    );
  }
}
