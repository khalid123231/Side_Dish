import 'package:flutter/material.dart';

class SBar1 extends StatelessWidget {
  final Function callbackfunction;
  final usernameController = TextEditingController();

   SBar1({Key? key, required this.callbackfunction, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              callbackfunction(usernameController.text);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}