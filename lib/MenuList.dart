import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'khalids material/global variabls/v.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  late List<Map<String, dynamic>> documents ;
  bool islooded = false;
  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('menu items').where('Restaurant address', isEqualTo: restaurantAddress).get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {
      documents = temp;
      islooded =true;
    });




  }
  void initState() {
    super.initState();

    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(restaurantName +' menu'),),
      body: SingleChildScrollView( child: SizedBox(height:500 ,child: islooded?ListView.builder(
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
            'price'+' : ' +  documents[index]['price'],
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

            leading:ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                documents[index]['menu item photo'],
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),tileColor: Colors.grey[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
            ),

            title: Text(
              documents[index]['item name'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),

            ),
          ));
        },
      ):Text('no data') ,)),
    );
  }
}
