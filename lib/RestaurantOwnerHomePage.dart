

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/AddRestaurantPage.dart';
import 'package:food_delivery_app_v3/RestaurantPage.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';

//import 'khalids material/SBar.dart';

class RestaurantOwnerHomePage extends StatefulWidget{
  @override
  State<RestaurantOwnerHomePage> createState() => _RestaurantOwnerHomePageState();
}

class _RestaurantOwnerHomePageState extends State<RestaurantOwnerHomePage> {

  String w ='';
  callback(varw){
    setState(() {
      w=varw;
    });

  }

  late List<Map<String, dynamic>> documents ;
  bool islooded = false;


  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('restaurant').get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {
      documents = temp;
      islooded =true;
    });



  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text("RestaurantOwnerList"),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddRestaurantPage(), ) );
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            //SBar1(callbackfunction: callback,),
            //Text('restarents') ,
            SizedBox(child: islooded?ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: documents.length, // Replace with the actual number of items
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(documents[index]['Restaurant logo']),
                  onTap: (){
                    restaurantAddress = documents[index]['Restaurant address'];
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantPage(), ) );
                  },
                  title: Text(documents[index]['Restaurant name']
                  ),
                );
              },
            ):Text('no data') ,height:500 ,)

          ],
        ),
      ),
    );
  }
}