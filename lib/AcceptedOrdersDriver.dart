

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/orderC.dart';

import 'MenuList.dart';
import 'khalids material/global variabls/v.dart';

class AcceptedOrdersDriver extends StatefulWidget {
  const AcceptedOrdersDriver({super.key});

  @override
  State<AcceptedOrdersDriver> createState() => _AcceptedOrdersDriverState();
}

class _AcceptedOrdersDriverState extends State<AcceptedOrdersDriver> {
  late List<Map<String, dynamic>> documents ;
  late List<Map<String, dynamic>> documents2 ;

  bool islooded = false;
  bool islooded2 = false;
  bool isNotEmpty = false;
  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('order').where('Driver', isEqualTo: logedinUsername).get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {
      documents = temp;
      islooded =true;

    });
  }
  Future<void> deliverOrder(int index) async {
    //item name shouldn't be changed
    //we should add item describtion and make it changable
    //are change the key
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('order').where('Restaurant address', isEqualTo: documents[index]['Restaurant address']).where('Username', isEqualTo: documents[index]['Username']).where('Driver', isEqualTo: logedinUsername).where('Status', isEqualTo: "on way").get();
    final fieldsToUpdate = {
      'Status' : "delivered",
    };
    await querySnapshot.docs.first.reference.update( fieldsToUpdate );
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('order has been delivered')));

  }

  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Deliver Orders', style: TextStyle(
              fontSize: 32, // Adjust the font size to make it big
              fontWeight: FontWeight.bold, // Make the text bold
              fontFamily: 'Pacifico', // Use a stylish font
              fontStyle: FontStyle.normal, // Make the text italic
              color: Colors.blue, // Use a stylish color
            ), textAlign: TextAlign.left,) , SizedBox(height:500 ,child: islooded?ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: documents.length, // Replace with the actual number of items
              itemBuilder: (context, index) {
                return Container(  decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                ),child: ListTile(subtitle: Text(
                  'Status'+' : ' +  documents[index]['Status']+',  delivery address: '+documents[index]['Restaurant address'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),trailing: IconButton(onPressed: () {
                  deliverOrder(index);
                }, icon: Icon(Icons.check_circle_rounded),),
                  /*leading:ClipRRect(

                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      documents[index]['Restaurant logo'],
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),

                  ),*/tileColor: Colors.grey[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                  ),

                  title: Text(
                    documents[index]['Status'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ));
              },
            ):Text('no data') ,)

          ],
        ),
      ),
    );
  }
}
