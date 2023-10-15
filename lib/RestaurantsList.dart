import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/khalids%20material/SBar.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';

class RestaurantList extends StatefulWidget {


  RestaurantList({super.key}) {
    // TODO: implement RestaurantList

  }

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {

  String w ='';
  callback(varw){
    setState(() {
      w=varw;
    });

  }

  late List<Map<String, dynamic>> documents ;
  bool islooded = false;


  void fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('restaurant').get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {
      documents = temp;
      islooded =true;
    });
    void initState() {
      super.initState();
      fetchData();
    }

  }
  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [ SBar1(callbackfunction: callback,),
            Text(w),FloatingActionButton(onPressed: () async {
              FirebaseFirestore firestore = FirebaseFirestore.instance;
              CollectionReference collectionRef = firestore.collection('restaurant');
              collectionRef.get().then((QuerySnapshot querySnapshot) {
                for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
                  Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
                 print(data['Restaurant name']) ;
                }
              });
            },) ,FloatingActionButton(onPressed: () { fetchData(); },), SizedBox(child: islooded?ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: documents.length, // Replace with the actual number of items
              itemBuilder: (context, index) {



                return ListTile(leading: Image.network(documents[index]['Restaurant logo']),

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
