



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/FavoriteList.dart';
import 'package:food_delivery_app_v3/RestaurantsList.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int curentPage = 0;
  List<Widget> pages = [ RestaurantList(), FavoriteList()];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

        title: Text("welcome " +logedinUsername),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: pages[curentPage],
      bottomNavigationBar: NavigationBar(destinations: const [NavigationDestination(icon:Icon(Icons.home), label: 'Home'),NavigationDestination(icon:Icon(Icons.star), label: 'favorits')],onDestinationSelected:(int index){
        setState(() {
          curentPage = index;
        });
      } , selectedIndex: curentPage,),

    );
  }
}
