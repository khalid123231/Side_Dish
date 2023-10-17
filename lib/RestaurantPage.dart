import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/AddMenuItem.dart';
import 'package:food_delivery_app_v3/EditMenuItem.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';

class RestaurantPage extends StatefulWidget {
  @override
  RestaurantPage({super.key}){

  }

  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {

  late List<Map<String, dynamic>> documents ;
  bool islooded = false;


  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('menu items').get();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddMenuItem(),
              ));
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
            SizedBox(
              child: islooded
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: documents.length,
                      // Replace with the actual number of items
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(documents[index]['item name']),
                          subtitle: Text(documents[index]['price']),
                          //title: Text("1"),
                          //subtitle: Text("2"),
                          leading: Icon(Icons.fastfood,),
                          trailing: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: IconButton(
                                onPressed: () {
                                  menuItemName =documents[index]['item name'];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditMenuItem(),
                                      ));
                                },
                                icon: Icon(
                                    Icons.edit,
                                )
                            ),
                          ),
                          /*leading: Image.network(
                              documents[index]['Restaurant logo']
                          ),*/

                          /*onTap: () {
                            restaurantAddress =
                                documents[index]['Restaurant address'];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RestaurantPage(),
                                )
                            );
                          },*/
                        );
                      },
                    )
                  : Text('no data'),
              height: 500,
            )
          ],
        ),
      ),
    );
  }
}
