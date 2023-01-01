import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Color.fromARGB(255, 218, 185, 88),
            alignment: Alignment.centerLeft,
            child: Text("Cooking Up !!", style: TextStyle(fontWeight: FontWeight.w900, fontSize:  30),),
          ),

          SizedBox(height: 20),

          ListTile(
            leading: Icon(Icons.restaurant, size: 26),
            title: Text("Meals", style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),


          ListTile(
            leading: Icon(Icons.settings, size: 26),
            title: Text("Filter", style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/filters-screen');
            }
          ),
        ],
      ),
    );
  }
}