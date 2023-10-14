import 'package:flutter/cupertino.dart';

class DataHolder extends StatefulWidget {
  @override
  _DataHolderState createState() => _DataHolderState();
}

class _DataHolderState extends State<DataHolder> {
  String myVariable = 'Hello';

  void updateVariable(String newVariable) {
    setState(() {
      myVariable = newVariable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}