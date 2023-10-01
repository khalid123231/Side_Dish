

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obsecureText;
  const MyTextField({super.key, required this.controller, required this.hintText, required this.obsecureText});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      child: Scaffold(
        body: Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextFormField(
            validator: (value){
              if (value == null || value.isEmpty){
                return 'please enter some text';
              }else
                null;

            },
            controller: controller,
            obscureText: obsecureText,
            decoration: InputDecoration(
              
              enabledBorder: const OutlineInputBorder(
                borderSide:   BorderSide(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),

              fillColor: Colors.grey.shade200,
              filled: true,
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.shade500)
            ),
          ),
        ),
      ),
    );
  }
}