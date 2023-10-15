
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/MyTextField.dart';
import 'package:food_delivery_app_v3/utils.dart';

class AddMenuItem extends StatefulWidget{
  @override
  State<AddMenuItem> createState() => _AddMenuItemState();
}

class _AddMenuItemState extends State<AddMenuItem> {

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController itemName = TextEditingController();
  TextEditingController itemPrice = TextEditingController();
  String restaurantRef = "restaurant/yEO02vQvGzKcnDulIinV";

  CollectionReference menuItems = FirebaseFirestore.instance.collection('menu items');

  Future<void> addMenuItem(){
    return menuItems.add({
      "item name" : itemName.text,
      "price" : itemPrice.text,
      "restaurant ref" : restaurantRef})
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
         child: Column(children: [
           Container(
             padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
             child: Column(children: [
               Text("Item name",style: TextStyle(
                 color: Colors.black,
                 fontSize: 25
               ),
               ),
               MyTextField(
                 controller: itemName,
                 hintText: 'Enter item name',
                 obsecureText: false,
               ),
             ],
             ),
           ),
           Container(
             padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
             child: Column(children: [
               Text("Item price",style: TextStyle(
                   color: Colors.black,
                   fontSize: 25
               ),
               ),
               MyTextField(
                 controller: itemPrice,
                 hintText: 'Enter item price',
                 obsecureText: false,
               ),
             ],
             ),
           ),
           Center(
             child: Container(
               padding: EdgeInsets.all(20),
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: Colors.blue,
                   side: BorderSide(color: Colors.blueAccent, width: 5
                   ),
                   textStyle: const TextStyle(
                     color: Colors.white,fontSize: 50
                   ),
                 ),
                 onPressed: () async {
                   if(formState.currentState!.validate()){
                     addMenuItem();
                   };
                 },
                 child: Text(
                   'Login',
                   textAlign: TextAlign.center,
                   style: SafeGoogleFont (
                     'Everett',
                     //fontSize: 17*ffem,
                     fontSize: 30,
                     fontWeight: FontWeight.w400,
                    // height: 1.3529411765*ffem/fem,
                     letterSpacing: -0.17*fem,
                     color: Color(0xffffffff),
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