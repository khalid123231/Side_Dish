
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app_v3/MyTextField.dart';
import 'package:food_delivery_app_v3/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String selectdC='Riyadh';
class dropdownL extends StatefulWidget {
  @override
  State<dropdownL> createState() => _dropdownLState();
}

class _dropdownLState extends State<dropdownL> {
  final List<String> items = ['Riyadh', 'Jeddah', 'Mecca'];
  String selectedItem = 'Riyadh';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: (value) {
        selectdC= value!;
        if (value != null && items.contains(value)) {
          setState(() {
            selectedItem = value!;
          });
        }
      },
      value: selectedItem,



    );

  }
}