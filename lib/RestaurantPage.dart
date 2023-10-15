



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/AddMenuItem.dart';

class RestaurantPage extends StatefulWidget{
  @override
  //String restaurantName;
  //RestaurantPage({required this.restaurantName});
  //State<RestaurantPage> createState() => _RestaurantPageState(this.restaurantName);
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {


  //late String restaurantName;
  //_RestaurantPageState(this.restaurantName);

  List<QueryDocumentSnapshot> data =[];
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("menu items").get();
    data.addAll(querySnapshot.docs);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("RestaurantPage"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddMenuItem(), ) );
        },
        child: Icon(Icons.add),
      ),

      body: GridView.builder(
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (context,i){
            return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(Icons.fastfood_outlined,),
                    Text(i as String),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}