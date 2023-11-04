import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';

class OrderC extends StatefulWidget {
  const OrderC({super.key});

  @override
  State<OrderC> createState() => _OrderCState();
}

class _OrderCState extends State<OrderC> {
  int sum=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        prices.forEach((element) { sum+=element;});
        print(sum);
        await FirebaseFirestore.instance.collection('order').add({
          'Status': 'sent',
          'Total':sum,
          'Items':items,
          'Restaurant address':restaurantAddress,
          'Counts':counts,
          'Username':logedinUsername,
          'Driver':'',

        });
      },),
    );
  }
}
