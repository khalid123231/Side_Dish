import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/AddMenuItem.dart';
import 'package:food_delivery_app_v3/EditMenuItem.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';
import 'package:food_delivery_app_v3/utils.dart';
import 'package:food_delivery_app_v3/Edittags.dart';
import 'Offer.dart';

class RestaurantPage extends StatefulWidget {
  @override
  RestaurantPage({super.key}){

  }

  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {

  late List<Map<String, dynamic>> documents ;
  bool islooded = false;
  late Image menuItem;

  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('menu items').where('Restaurant address', isEqualTo: restaurantAddress).get();
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
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;


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
            SwitchScreen(),
            //SBar1(callbackfunction: callback,),
            //Text('restarents') ,
            SizedBox(
              height: 500,
              child: islooded
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: documents.length,
                      // Replace with the actual number of items
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(documents[index]['item name']!),
                          subtitle: Text(documents[index]['price']!),
                          //title: Text("1"),
                          //subtitle: Text("2"),
                          leading: Image.network(documents[index]['menu item photo']!),
                          trailing: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: IconButton(
                                onPressed: () {
                                  menuItemName =documents[index]['item name']!;
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
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(

                // frame74rvm (1:1671)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 24*fem),
                padding: EdgeInsets.fromLTRB(10*fem, 10*fem, 13*fem, 10*fem),
                width: double.infinity,
                height: 63*fem,
                decoration: BoxDecoration (
                  //color: Color(0x4ced9b11),
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(230*fem),
                ),
                child: Container(
                  // frame1029ey (1:1672)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                  width: 151*fem,
                  height: double.infinity,
                  decoration: BoxDecoration (
                    //color: Color(0xffed9b11),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(90*fem),
                  ),
                  child: Center(
                    child :TextButton(onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Edittags(),
                          ));
                    },
                      child: Text(
                        'Edit tags',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Everett',
                          fontSize: 17*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.3529411765*ffem/fem,
                          letterSpacing: -0.17*fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),

      ),
    );
  }
}


