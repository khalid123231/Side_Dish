

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/orderC.dart';

import 'MenuList.dart';
import 'khalids material/global variabls/v.dart';

class ordersListDriver extends StatefulWidget {
  const ordersListDriver({super.key});

  @override
  State<ordersListDriver> createState() => _ordersListDriverState();
}

class _ordersListDriverState extends State<ordersListDriver> {
  late List<Map<String, dynamic>> documents ;
  late List<Map<String, dynamic>> documents2;

  bool islooded = false;
  bool islooded2 = false;
  bool isNotEmpty = false;
  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('order').where('Driver', isEqualTo: "").where("Status", isEqualTo: "accepted" ).get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {
      documents = temp;
      islooded =true;

    });
  }
  Future<void> fetchData2(int index) async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('restaurant').where('Restaurant address', isEqualTo: documents[index]['Restaurant address']).get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {
      documents2 = temp;
      islooded2 =true;

    });
  }
  Future<void> acceptOrder(int index) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('order').where('Restaurant address', isEqualTo: documents[index]['Restaurant address']).where('Username', isEqualTo: documents[index]['Username']).where('Driver', isEqualTo: "").where("Status", isEqualTo: "accepted" ).get();
    final fieldsToUpdate = {
      'Driver' : logedinUsername,
      'Status' : "on way",
    };
    await querySnapshot.docs.first.reference.update( fieldsToUpdate );
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('order has been accepted!')));
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
            Text('Accept Orders', style: TextStyle(
              fontSize: 32, // Adjust the font size to make it big
              fontWeight: FontWeight.bold, // Make the text bold
              fontFamily: 'Pacifico', // Use a stylish font
              fontStyle: FontStyle.normal, // Make the text italic
              color: Colors.blue, // Use a stylish color
            ), textAlign: TextAlign.left,) , SizedBox(height:500 ,child: islooded?ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: documents.length,
              itemBuilder: (context, index) {

                return Container( decoration: BoxDecoration(
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
                  acceptOrder(index);
                }, icon: Icon(Icons.check_circle_rounded),),
                  leading:ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      documents[index]['logo'],
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  tileColor: Colors.grey[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                  ),

                  title: Text(
                    documents[index]['Restaurant Name']+'  ID:' +documents[index]['OrderID'],
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
