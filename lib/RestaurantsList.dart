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
    if(w!=''){
   fetchData1();}
    else{fetchData();}
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
  Future<void> fetchData1() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('restaurant').where('Restaurant name'  , isEqualTo: w ).get();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [ SBar1(callbackfunction: callback,),
            Text('restarents') , SizedBox(height:500 ,child: islooded?ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: documents.length, // Replace with the actual number of items
              itemBuilder: (context, index) {



                return ListTile(leading: Image.network(documents[index]['Restaurant logo']),

                  title: Text(documents[index]['Restaurant name']

                  ), trailing: IconButton(onPressed: () async {
                         QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('favorites').where('Username',isEqualTo: logedinUsername ).where('Restaurant name',isEqualTo: documents[index]['Restaurant name'] ).get();
                         if(querySnapshot.docs.isEmpty){
                           await FirebaseFirestore.instance.collection('favorites').add({
                             'Restaurant name':documents[index]['Restaurant name'],
                             'Restaurant phone number':documents[index]['Restaurant phone number'],
                             'Restaurant city':documents[index]['Restaurant city'],
                             'Restaurant address':documents[index]['Restaurant address'],
                             'Restaurant logo':documents[index]['Restaurant logo'],
                             'Username':logedinUsername,

                           });
                           ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(content: Text('the Restaurant has been added to the favorites')));

                         }else{
                         await querySnapshot.docs.first.reference.delete();
                          ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(content: Text('the Restaurant has been removed to the favorites')));
                         }



                  }, icon: Icon(Icons.star),),
                );
              },
            ):Text('no data') ,)

          ],
        ),
      ),
    );
  }
}
