



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
        leading: Row(
          children: [
            Image.network("https://firebasestorage.googleapis.com/v0/b/side-dish-756b7.appspot.com/o/images%2F1697555108921?alt=media&token=d6c36055-f773-431d-adc8-bfac8eb6b691"),
            // Add some spacing between the image and the title
          ],
        ),

        title: Text("welcome " +logedinUsername),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        child: pages[curentPage],
      ),

      bottomNavigationBar: NavigationBar(destinations: const [NavigationDestination(icon:Icon(Icons.home), label: 'Home'),NavigationDestination(icon:Icon(Icons.star), label: 'favorits')],onDestinationSelected:(int index){
        setState(() {
          curentPage = index;
        });
      } , selectedIndex: curentPage,),

    );
  }
}
