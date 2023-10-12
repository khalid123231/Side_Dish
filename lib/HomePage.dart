



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }

}