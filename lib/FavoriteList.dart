import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Welcome f")),
    );
  }
}
