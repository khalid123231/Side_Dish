
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/MyTextField.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';
import 'package:food_delivery_app_v3/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_delivery_app_v3/AddRestaurantPage.dart';

import 'LoginPage.dart';

class Edittags extends StatefulWidget {
  @override
  State<Edittags> createState() => _EdittagsState();
}

class _EdittagsState extends State<Edittags> {

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController tagController = TextEditingController();
  late List<String> tagsarray;
  CollectionReference menuItemsCollection =
  FirebaseFirestore.instance.collection('restaurant');
  Future<void> Edittag() async {
    QuerySnapshot tagsSnapShot = await menuItemsCollection
        .where('Restaurant address', isEqualTo: restaurantAddress)
        .get();
    List<String> tagsarray = tagController.text.split(',');
    tagsarray.remove("");
    final fieldsToUpdate = {
      'Restaurant tags' : tagsarray,
    };
    CollectionReference tagsCollection =
    FirebaseFirestore.instance.collection('tags');
    QuerySnapshot alltagsSnapshot1 = await tagsCollection
        .where('alltags', arrayContainsAny: tagsarray)
        .get();
    if(alltagsSnapshot1.docs.isEmpty){
      await firestore.collection('tags').add({
        'alltags': tagsarray,
      });
    }
    return tagsSnapShot.docs.first.reference.update(fieldsToUpdate);
    }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add an item to menu"),
      ),
      body: Form(
        key: formState,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                children: [
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
                      controller: tagController,
                      hintText: 'Enter Restaurant tags',
                      obsecureText: false,
                    ),
                  ),
            Center(
              child: Container(
                // frame1029ey (1:1672)
                //margin: EdgeInsets.fromLTRB(25 * fem, 0 * fem, 10 * fem, 0 * fem),
                width: 151 * fem,

                decoration: BoxDecoration(
                  //color: Color(0xffed9b11),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(90 * fem),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () async {
                      if(formState.currentState!.validate()){
                            Edittag();
                          }
                      },
                    child: Text(
                      'edit tag',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Everett',
                        fontSize: 17 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3529411765 * ffem / fem,
                        letterSpacing: -0.17 * fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    ),
    ],
    ),
    ),
    );

  }
}
