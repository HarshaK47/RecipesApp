

import 'package:flutter/material.dart';
import '../dummy_data.dart';

class Recipe extends StatelessWidget {
  static const routeName = '/recipe';

  final Function toggleFavourite;
  final Function isFavourite;

  Recipe(this.toggleFavourite,this.isFavourite);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final meal = DUMMY_MEALS.where((rec) {
      return rec.id == routeArgs['id'];
    }).toList();

    List trueitems = [];
    if(meal[0].isGlutenFree==true){
      trueitems.add("Gluten Free");
    }
    if(meal[0].isLactoseFree==true){
      trueitems.add("Lactose Free");
    }
    if(meal[0].isVegan==true){
      trueitems.add("Vegan");
    }
    if(meal[0].isVegetarian==true){
      trueitems.add("Vegetarian");
    }



    return Scaffold(
        appBar: AppBar(
          title: Text(routeArgs['title'].toString()),
        ),
        body: Card(
          elevation: 5,
          margin: const EdgeInsets.all(0),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(15),
          // ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(15),
                //   topRight: Radius.circular(15),
                // ),
                child: Image.network(
                  meal[0].imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Text(
                  meal[0].title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                ...(trueitems.map((tItem){
                  return(
                    Row(children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                          ),
                        child: Container(padding: EdgeInsets.all(5) ,
                      decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(15)),
                      child: Text(tItem,style: TextStyle(color: Colors.white),)),
                      ),
                      
                    ],)
                  );
                }).toList()),

              ],),





              Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Color.fromARGB(255, 218, 208, 180)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Ingredients",style: TextStyle(fontSize: 18,color: Colors.blue,fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
                          ...(meal[0].ingredients.map((ing){
                            return (Text("\u2022 ${ing}", style: TextStyle(fontSize: 15)));
                          }).toList()),
                        ],
                      ),
                    )),
              ),


                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Color.fromARGB(255, 218, 208, 180)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Steps",style: TextStyle(fontSize: 18,color: Colors.blue,fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
                          ...(meal[0].steps.map((ing){
                            return (Text("\u2022 ${ing}", style: TextStyle(fontSize: 15)));
                          }).toList()),
                        ],
                      ),
                    )),
                  ),

                  

            ],


          ),
        ),
        
        floatingActionButton: FloatingActionButton(
          
          child: isFavourite(meal[0].id)?Icon(Icons.favorite):Icon(Icons.favorite_border),
          onPressed: (){
            toggleFavourite(meal[0].id);
          },
          ),
        
        );
  }
}
