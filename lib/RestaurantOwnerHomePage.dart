

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/RestaurantPage.dart';

class RestaurantOwnerHomePage extends StatefulWidget{
  @override
  State<RestaurantOwnerHomePage> createState() => _RestaurantOwnerHomePageState();
}

class _RestaurantOwnerHomePageState extends State<RestaurantOwnerHomePage> {

  List<QueryDocumentSnapshot> data =[];
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("restaurant").get();
    data.addAll(querySnapshot.docs);
    setState(() {

    });
  }
  String RestaurantName = "";
  @override
  void initState(){
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant owner HomePage"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,i){
            //if(("${data[i]['Restaurant name']}") == "r1test"){
            //if ()
            return ListTile(
              trailing:  Icon( Icons.fastfood,),
              // data problem !!!
              //title: Text("${data[i]['Restaurant name']}"),
              title: Text("test"),
              onLongPress: () {
                RestaurantName = "test";
                Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantPage(), ) );
              },

            );
            }
          ),
    );
  }
}