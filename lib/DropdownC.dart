
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app_v3/MyTextField.dart';
import 'package:food_delivery_app_v3/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String selectdComplaint='missing item';
class dropdownC extends StatefulWidget {
  @override
  State<dropdownC> createState() => _dropdownCState();
}

class _dropdownCState extends State<dropdownC> {
  final List<String> items = ['missing item', 'order did not arrive', 'order is late','driver doesnt respond'];
  String selectedItem = 'missing item';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: (value) {
        selectdComplaint= value!;
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