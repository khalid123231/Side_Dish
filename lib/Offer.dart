import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/utils.dart';

import 'khalids material/global variabls/v.dart';

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}
class SwitchClass extends State {
  late List<Map<String, dynamic>> documents ;
  bool isSwitched = false;
  var textValue = '';

  void updateData(bool switched) async {
    var querySnapshot = await FirebaseFirestore.instance.collection('restaurant').where('Restaurant address', isEqualTo: restaurantAddress).get();
    final fieldsToUpdate = {
      'has offer' : switched,
    };
    await querySnapshot.docs.first.reference.update( fieldsToUpdate );
  }
  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    var querySnapshot = await FirebaseFirestore.instance.collection('restaurant').where('Restaurant address', isEqualTo: restaurantAddress).get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {
      documents = temp;
      if(documents.isNotEmpty)
      isSwitched=documents[0]['has offer'];
      if(isSwitched==true){
        textValue = 'there is an offer';
      }else{
        textValue = 'no offer';
      }
    });



  }

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'there is an offer';
        updateData(isSwitched);
      });
    }
    else
    {
      setState(()  {
        isSwitched = false;
        textValue = 'no offer';
        updateData(isSwitched);
      });

    }
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

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ Transform.scale(
            scale: 1,
            child: Switch(
              onChanged: toggleSwitch,
              value: isSwitched,
              activeColor: Colors.blue,
              activeTrackColor: Colors.yellow,
              inactiveThumbColor: Colors.redAccent,
              inactiveTrackColor: Colors.orange,
            )
        ),
          Text('$textValue', style: SafeGoogleFont (
            'Everett',
            fontSize: 17*ffem,
            fontWeight: FontWeight.w400,
            height: 1.3529411765*ffem/fem,
            letterSpacing: -0.17*fem,
            color: Color(0xff292d32),
          ),)
        ]);
  }
}