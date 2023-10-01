

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/userDetails.dart';

class Details extends StatelessWidget{

  Details({Key? key , required this.userDetails,})
      : super(key: key);
  UserDetails userDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Container(
        padding: const EdgeInsets.all(4.0),
        child: ListView(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.0, color: Colors.blue.shade800)
              ),
              leading: IconButton(
                icon: Icon(Icons.verified_user, color: Colors.blue,),
                onPressed: (){},
              ),
              title: Column(
                mainAxisAlignment:  MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /*const Chip(
                    label: Text("User"),
                    backgroundColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.amber),
                  ),*/
                  Text(userDetails.fullName),
                  Text(userDetails.username),
                  Text(userDetails.password),
                  Text(userDetails.phoneNumber),
                  Text(userDetails.userRole.name),
                ],
              ),
            )
          ],
        ),
      ),
    );


    throw UnimplementedError();
  }

}