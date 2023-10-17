
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app_v3/MyTextField.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';
import 'package:food_delivery_app_v3/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app_v3/DropDownList.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'LoginPage.dart';

class AddRestaurantPage extends StatefulWidget{
  @override
  State<AddRestaurantPage> createState() => _AddRestaurantPageState();
}

class _AddRestaurantPageState extends State<AddRestaurantPage> {
  final _formfield = GlobalKey<FormState>();
  final restaurantNameController = TextEditingController();
  final restaurantPhoneNumberController = TextEditingController();
  final restaurantAddressController = TextEditingController();
  final restaurantCityController = TextEditingController();
  final tagsController = TextEditingController();





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
              'Side dish'
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
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 124*fem, 21*fem),
                      width: 224*fem,
                      height: 66*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // welcomeAuX (1:1669)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 143*fem,
                                height: 46*fem,
                                child: Text(
                                  'Welcome!',
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
                                height: 23*fem,
                                child: Text(
                                  'Add a Restaurant ',
                                  style: SafeGoogleFont (
                                    'Everett',
                                    fontSize: 17*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3529411765*ffem/fem,
                                    letterSpacing: -0.17*fem,
                                    color: Color(0xff6a788a),
                                  ),
                                ),
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

                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 220*fem, 6*fem),
                              child: Text(
                                'Restaurant name',
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
                                controller: restaurantNameController,
                                hintText: 'Enter Restaurant Name',
                                obsecureText: false,
                              ),
                            ),

                            Container(

                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 150*fem, 6*fem),
                              child: Text(
                                'Restaurant phone number',
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
                                controller: restaurantPhoneNumberController,
                                hintText: 'Enter Restaurant Phone Number',
                                obsecureText: false,
                              ),
                            ),
                            Container(

                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 220*fem, 6*fem),
                              child: Text(
                                'Restaurant City',
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
                                child: dropdownL(),

                            ),

                            Container(

                              margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 205*fem, 6*fem),
                              child: Text(
                                'Restaurant Address',
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
                                controller: restaurantAddressController,
                                hintText: 'Enter Restaurant Address',
                                obsecureText: false,
                              ),
                            ),
                            Container(

                              margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 170*fem, 6*fem),
                              child: Text(
                                'tags put , between them',
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
                                controller: tagsController,
                                hintText: 'Enter Restaurant tags',
                                obsecureText: false,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 180*fem, 6*fem),
                              child: Text(
                                'Upload Restaurant logo',
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
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.fromHeight(56),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ), onPressed: () async {
                                 ImagePicker imagePicker=ImagePicker();
                                 logo= await imagePicker.pickImage(source: ImageSource.gallery);

                              }, child: Row(
                                children: [
                                  Text("choose photo", style: SafeGoogleFont (
                                  'Everett',
                                  fontSize: 17*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3529411765*ffem/fem,
                                  letterSpacing: -0.17*fem,
                                  color: Color(0xff292d32),
                                ),),
                                ],
                               ),
                              ),
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
                                  if(logo!=null) {
                                    Reference referenceRoot = FirebaseStorage
                                        .instance.ref();
                                    Reference referenceDirImages = referenceRoot
                                        .child('images');
                                    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

                                    Reference referenceImageToUplode = referenceDirImages
                                        .child(uniqueFileName);
                                    try {
                                      await referenceImageToUplode.putFile(File(logo!.path));

                                      imageUrl= await referenceImageToUplode.getDownloadURL();

                                    }catch (error) {
                                    }
                                  }
                                  CollectionReference restaurantAddress0 =
                                  FirebaseFirestore.instance.collection('restaurant');
                                  QuerySnapshot restaurantAddress1 = await restaurantAddress0
                                      .where('Restaurant address', isEqualTo: restaurantAddressController.text)
                                      .get();
                                  if(imageUrl.isEmpty){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please uplode an image'),));
                                  }else{
                                    if(restaurantAddress1.docs.isEmpty==false){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please use different address'),));
                                    }else{
                                 List<String> tagsarray = tagsController.text.split(',');
                                 tagsarray.remove("");
                                  await firestore.collection('restaurant').add({
                                    'Restaurant owner username' : logedinUsername,
                                    'Restaurant name': restaurantNameController.text,
                                    'Restaurant phone number': restaurantPhoneNumberController.text,
                                    'Restaurant city': selectdC,
                                    'Restaurant address': restaurantAddressController.text,
                                    'Restaurant logo': imageUrl,
                                    'Restaurant tags': tagsarray,
                                    'has offer': false,
                                  });
                                }}}

                              },
                              child: Text(
                                'Add Restaurant',
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
