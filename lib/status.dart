
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app_v3/HistoryCustomer.dart';
import 'package:food_delivery_app_v3/MyTextField.dart';
import 'package:food_delivery_app_v3/RestaurantOwnerHomePage.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';
import 'package:food_delivery_app_v3/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'DropdownC.dart';
import 'HomePage.dart';
import 'LoginPage.dart';

class StatusAndComplain extends StatefulWidget{
  @override
  State<StatusAndComplain> createState() => _StatusAndComplainState();
}

class _StatusAndComplainState extends State<StatusAndComplain> {
  final _formfield = GlobalKey<FormState>();
  final complanController = TextEditingController();




  bool islooded = false;
  late List<Map<String, dynamic>> documents ;

  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('order').where('OrderID', isEqualTo: orderID).get();
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

  Future<void> complainOrder() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('order').where('OrderID', isEqualTo: orderID).get();
    final fieldsToUpdate = {
      'complaint' : complanController.text,
      'complaint type' : selectdComplaint,
    };

    await querySnapshot.docs.first.reference.update( fieldsToUpdate );
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('complaint has been sent')));
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(), ) );
  }


  get onPressed => null;
  XFile? logo;
  String imageUrl='';



  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              'Order'
          ),
          backgroundColor: Colors.blue,

        ),
        body: Container(

            child: SingleChildScrollView(

              child: Container(

                // loginYrD (1:1668)
                padding: EdgeInsets.fromLTRB(16*fem, 10*fem, 16*fem, 8*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(46*fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupyeedrdw (AdWRrs2GpqAfzRzUxJyEeD)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25*fem, 21*fem),
                      width: 400*fem,
                      height: 160*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // welcomeAuX (1:1669)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(

                                width: 220*fem,
                                height: 100*fem,
                                child:  Text(
                                  'Status of order',
                                  style: SafeGoogleFont (
                                    'Everett',
                                    fontSize: 36*ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2777777778*ffem/fem,
                                    letterSpacing: -0.72*fem,
                                    color: Color(0xff292d32),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // signuporlogintoyouraccount19T (1:1670)
                            left: 0*fem,
                            top: 43*fem,
                            child: Align(
                              child: SizedBox(
                                width: 290*fem,
                                height: 100*fem,
                                child: islooded? Text(
                                  'status: '+documents[0]['Status'],
                                  style: SafeGoogleFont (
                                    'Everett',
                                    fontSize: 22*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 7.5*ffem/fem,
                                    letterSpacing: -0.17*fem,

                                  ),
                                ):Text('no data',),
                              ),
                            ),
                          ),
                          Positioned(
                            // signuporlogintoyouraccount19T (1:1670)
                            left: 0*fem,
                            top: 43*fem,
                            child: Align(
                              child: SizedBox(
                                width: 290*fem,
                                height: 120*fem,
                                child: islooded? Text(
                                  'driver: '+documents[0]['Driver'],
                                  style: SafeGoogleFont (
                                    'Everett',
                                    fontSize: 22*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 10*ffem/fem,
                                    letterSpacing: -0.17*fem,

                                  ),
                                ):Text('',),
                              ),
                            ),
                          ),
                          Positioned(
                            // signuporlogintoyouraccount19T (1:1670)
                            width: 360*fem,
                            left: 0*fem,
                            top: 43*fem,
                            height: 400*fem,
                            child: Align(
                              child: SizedBox(
                                width: 400*fem,
                                height: 500*fem,
                                child: islooded? Text(
                                  'previous complaint: '+documents[0]['complaint'],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: SafeGoogleFont (
                                    'Everett',
                                    fontSize: 22*ffem,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                    letterSpacing: -0.17*fem,
                                  ),
                                  softWrap: true,
                                ):Text('',),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // username text + username textField + password text + password textfield
                      child: Form(
                        key: _formfield,
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(

                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 180*fem, 6*fem),
                              child: Text(
                                'complain about the order',
                                style: SafeGoogleFont (
                                  'Everett',
                                  fontSize: 17*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3529411765*ffem/fem,
                                  letterSpacing: -0.17*fem,
                                  color: Color(0xff292d32),
                                ),
                              ),
                            ),
                            Container(
                              child: MyTextField(
                                controller: complanController,
                                hintText: 'Explain what happened',
                                obsecureText: false,
                              ),
                            ),


                            Container(

                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 220*fem, 6*fem),
                              child: Text(
                                'Complain type',
                                style: SafeGoogleFont (
                                  'Everett',
                                  fontSize: 17*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3529411765*ffem/fem,
                                  letterSpacing: -0.17*fem,
                                  color: Color(0xff292d32),

                                ),
                              ),
                            ),
                            Container(
                              child: dropdownC(),

                            ),


                          ],
                        ),
                      ),
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
                            child: TextButton(
                              onPressed: () async {
                                if(_formfield.currentState!.validate()){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Processing data')));

                                  CollectionReference Complains =
                                  FirebaseFirestore.instance.collection('order');
                                  QuerySnapshot complaint1 = await Complains
                                      .where('OrderID', isEqualTo: orderID).where('complaint', isEqualTo: "")
                                      .get();


                                    if(complaint1.docs.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('already sent a complaint'),));
                                    }else{
                                      complainOrder();
                                    }}

                              },
                              child: Text(
                                'send complaint',
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
                    )
                  ],
                ),
              ),
            )
        )
    );
    throw UnimplementedError();
  }
}
