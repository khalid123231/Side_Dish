import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/khalids%20material/SBar.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';

class RestaurantList extends StatefulWidget {
String w ='sss';

  RestaurantList({super.key}) {
    // TODO: implement RestaurantList

  }

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [ SBar1()

          ],
        ),
      ),
    );
  }
}
