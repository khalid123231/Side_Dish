import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/AcceptedOrdersDriver.dart';
import 'package:food_delivery_app_v3/FavoriteList.dart';
import 'package:food_delivery_app_v3/RestaurantsList.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';
import 'package:food_delivery_app_v3/ordersListDriver.dart';

class HomePageDriver extends StatefulWidget{
  @override
  State<HomePageDriver> createState() => _HomePageDriverState();
}

class _HomePageDriverState extends State<HomePageDriver> {
  int curentPage = 0;
  List<Widget> pages = [ ordersListDriver(), AcceptedOrdersDriver()];


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

      bottomNavigationBar: NavigationBar(destinations: const [NavigationDestination(icon:Icon(Icons.home), label: 'Orders'),NavigationDestination(icon:Icon(Icons.delivery_dining), label: 'Accepted Orders')],onDestinationSelected:(int index){
        setState(() {
          curentPage = index;
        });
      } , selectedIndex: curentPage,),

    );
  }
}