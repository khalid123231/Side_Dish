import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'khalids material/global variabls/v.dart';

class RestaurantOwnerOrdersPage extends StatefulWidget {
  @override
  State<RestaurantOwnerOrdersPage> createState() =>
      _RestaurantOwnerOrdersPageState();
}

class _RestaurantOwnerOrdersPageState extends State<RestaurantOwnerOrdersPage> {
  late List<Map<String, dynamic>> restList;
  late List<Map<String, dynamic>> allOrders;
  late List<Map<String, dynamic>> pendingOrders;
  late List<Map<String, dynamic>> activeOrders;
  late List<Map<String, dynamic>> pastOrders;
  bool islooded = false;
  bool islooded2 = false;
  bool islooded3 = false;

  Future<void> fetchDataRestList() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('restaurant')
        .where('Restaurant owner username', isEqualTo: logedinUsername)
        .get();
    querySnapshot.docs.forEach((e) {
      temp.add(e.data() as Map<String, dynamic>);
    });
    setState(() {
      restList = temp;
    });
    fetchDataOrders();
  }

  Future<void> fetchDataOrders() async {
    List<Map<String, dynamic>> allOr = [];
    List<Map<String, dynamic>> pending = [];
    List<Map<String, dynamic>> delivered = [];
    List<Map<String, dynamic>> active = [];
    QuerySnapshot querySnapshotAll = await FirebaseFirestore.instance
        .collection('order')
    //
    //.where('Status', isEqualTo: 'Sent')
        .get();
    querySnapshotAll.docs.forEach((e) {
      allOr.add(e.data() as Map<String, dynamic>);
    });
    setState(() {
      pendingOrders = allOr;
      islooded = true;
    });/*
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('order')
        //
        //.where('Status', isEqualTo: 'Sent')
        .get();
    querySnapshot.docs..forEach((e) {
      pending.add(e.data() as Map<String, dynamic>);
    });
    setState(() {
      pendingOrders = pending;
      islooded = true;
    });*/
    /*
    QuerySnapshot querySnapshot3 = await FirebaseFirestore.instance
        .collection('order')
    //.where('Restaurant address', whereIn: restList)
        .where('Status', isNotEqualTo: 'Sent')
        .where('Status', isNotEqualTo: 'delivered')
        .get();
    querySnapshot3.docs.forEach((e) {
      active.add(e.data() as Map<String, dynamic>);
    });
    setState(() {
      activeOrders = active;
      islooded2 = true;
    });
    QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance
        .collection('order')
        //.where('Restaurant address', whereIn: restList)
        .where('Status', isEqualTo: 'delivered')
        .get();
    querySnapshot2.docs.forEach((e) {
      delivered.add(e.data() as Map<String, dynamic>);
    });
    setState(() {
      pastOrders = delivered;
      islooded3 = true;
    });
*/
  }

  Future<void> acceptOrder(String address, String username, int total) async {

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('order').where('Restaurant address', isEqualTo: address).where('Username', isEqualTo: username).where('Total', isEqualTo: total).get();
    final fieldsToUpdate = {
      'Status' : 'accepted',
    };
    await querySnapshot.docs.first.reference.update( fieldsToUpdate );
    setState(() {

    });
  }
  Future<void> rejectOrder(String address, String username, int total) async {

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('order').where('Restaurant address', isEqualTo: address).where('Username', isEqualTo: username).where('Total', isEqualTo: total).get();
    final fieldsToUpdate = {
      'Status' : 'rejected',
    };
    await querySnapshot.docs.first.reference.update( fieldsToUpdate );
    setState(() {

    });
  }


  String fetchItemCounts(int number){
    String items = '';
    items += pendingOrders[number]['Status'].toString();
    items += ". ";
    for(int i =0;i<pendingOrders[number]['Items'].length;i++){
      items += pendingOrders[number]['Items'][i].toString();
          items +=' x';
          items += pendingOrders[number]['Counts'][i].toString();
      items +=', ';
    }
    items += ".  Total: ";
    items += pendingOrders[number]['Total'].toString();
    return items;
  }
  Row statusIcons(String status, index){
    if(status == 'sent')
    return Row(

      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: (){
              acceptOrder(pendingOrders[index]['Restaurant address'],pendingOrders[index]['Username'],pendingOrders[index]['Total']);
            },
            icon: Icon(Icons.check)),

        IconButton(onPressed: (){
          rejectOrder(pendingOrders[index]['Restaurant address'],pendingOrders[index]['Username'],pendingOrders[index]['Total']);
        }
            ,icon: Icon(Icons.dangerous)
        )
      ],
    );
    else 
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        ],
      );

  }


  @override
  void initState() {
    super.initState();
    fetchDataRestList();
    //fetchDataOrders();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Text("all orders",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 800,
            child: islooded
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: pendingOrders.length,
                    // Replace with the actual number of items
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                          ),
                          child: ListTile(
                            subtitle: Text(fetchItemCounts(index),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                pendingOrders[index]['logo'],
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            tileColor: Colors.grey[50],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(8)),
                            ),
                            onTap: () {},
                            title: Text(
                              //fetchRestName(pendingOrders[index]['Restaurant address']),
                              pendingOrders[index]['Status'],

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: SizedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100
                                ),
                                //child: Text(pendingOrders[index]['Status']),
                                child: /*Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                    onPressed: (){
                                      acceptOrder(pendingOrders[index]['Restaurant address'],pendingOrders[index]['Username'],pendingOrders[index]['Total']);
                                      },
                                        icon: Icon(Icons.check)),

                                    IconButton(onPressed: (){
                                      rejectOrder(pendingOrders[index]['Restaurant address'],pendingOrders[index]['Username'],pendingOrders[index]['Total']);
                                      }
                                        ,icon: Icon(Icons.dangerous)
                                    )
                                  ],
                                ),*/
                                statusIcons(pendingOrders[index]['Status'], index)
                              ),
                            ),
                          ));
                    },
                  )
                : Text('no data'),
          ),
          //here active
        ],
      ),
    );
  }
}
