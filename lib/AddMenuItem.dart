
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/MyTextField.dart';
import 'package:food_delivery_app_v3/RestaurantPage.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';
import 'package:food_delivery_app_v3/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_delivery_app_v3/AddRestaurantPage.dart';

class AddMenuItem extends StatefulWidget {
  @override
  State<AddMenuItem> createState() => _AddMenuItemState();
}

class _AddMenuItemState extends State<AddMenuItem> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemPriceController = TextEditingController();

  CollectionReference menuItems =
      FirebaseFirestore.instance.collection('menu items');
  XFile? menuitemphoto;
  String imageUrlmenu='';
  Future<void> addMenuItem() {
    return menuItems
        .add({
          "item name": itemNameController.text,
          "price": itemPriceController.text,
          "Restaurant address": restaurantAddress,
          "menu item photo": imageUrlmenu,
        })
        .then((value) => print("Item added"))
        .catchError((error) => print("Failed to add item: $error"));

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
                  Text(
                    "Item name",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  MyTextField(
                    controller: itemNameController,
                    hintText: 'Enter item name',
                    obsecureText: false,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                children: [
                  Text(
                    "Item price",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  MyTextField(
                    controller: itemPriceController,
                    hintText: 'Enter item price',
                    obsecureText: false,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 180*fem, 6*fem),
              child: Text(
                'Upload menu item picture',
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
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 40*fem),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(56),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ), onPressed: () async {
                ImagePicker imagePicker=ImagePicker();
                 menuitemphoto= await imagePicker.pickImage(source: ImageSource.gallery);

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
                    onPressed: () async {/*
                      if (formState.currentState!.validate()) {
                        addMenuItem();
                      }*/
                      if(formState.currentState!.validate()){
                        CollectionReference menuItemsCollection =
                        FirebaseFirestore.instance.collection('menu items');

                        QuerySnapshot menuItemsSnapShot = await menuItemsCollection
                            .where('Restaurant address', isEqualTo: restaurantAddress)
                            .where('item name', isEqualTo: itemNameController.text)
                            .get();

                        if(menuItemsSnapShot.docs.isEmpty){
                            if(menuitemphoto!=null) {
                              Reference referenceRoot = FirebaseStorage.instance.ref();
                              Reference referenceDirImages = referenceRoot.child('menuitemimages');
                              String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

                            Reference referenceImageToUplode = referenceDirImages.child(uniqueFileName);
                            try {
                            await referenceImageToUplode.putFile(File(menuitemphoto!.path));

                            imageUrlmenu= await referenceImageToUplode.getDownloadURL();

                            }catch (error) {
                            }
                            }
                            if(imageUrlmenu.isEmpty){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please uplode an image'),));
                            }else {
                              addMenuItem();
                              Navigator.pop(context);
                            }}
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please choose a different name'),));
                        }
                      }
                    },
                    child: Text(
                      'Add Item',
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
    );
  }
}
