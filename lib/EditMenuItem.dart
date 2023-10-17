import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/MyTextField.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';
import 'package:food_delivery_app_v3/utils.dart';
class EditMenuItem extends StatefulWidget{
  @override
  State<EditMenuItem> createState() => _EditMenuItemState();
}

class _EditMenuItemState extends State<EditMenuItem> {


  late List<Map<String, dynamic>> documents ;
  bool islooded = false;


  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('menu items').get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {
      documents = temp;
      islooded =true;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemPriceController = TextEditingController();

  Future<void> updateMenuItem() async {
    //item name shouldn't be changed
    //we should add item describtion and make it changable
    //are change the key
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('menu items').where('Restaurant address', isEqualTo: restaurantAddress).where('item name', isEqualTo: menuItemName).get();
    final fieldsToUpdate = {
      'price' : itemPriceController.text,
    };
    await querySnapshot.docs.first.reference.update( fieldsToUpdate );
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('the Item price Has been changed')));
    Navigator.pop(context);
  }
  Future<void> deleteItem() async{
    //confirmation is still in progress
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('menu items').where('Restaurant address', isEqualTo: restaurantAddress).where('item name', isEqualTo: menuItemName).get();
    await querySnapshot.docs.first.reference.delete();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('the Item Has been Deleted ')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add an item to menu"),
      ),
      body: Form(
        key: formState,
        child: Column(
          children: [
            /*Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                children: [
                  /*Text(
                    "Item name",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),*/
                  Text(
                    "previous name is: ", //+ prevItemName,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  MyTextField(
                    controller: itemNameController,
                    hintText: 'Enter item name',
                    obsecureText: false,
                  ),
                ],
              ),
            ),*/
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                children: [
                  /*Text(
                    "Item price",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),*/
                  Text(
                    "previous price is: "// + prevItemPrice,
                    ,style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  MyTextField(
                    controller: itemPriceController,
                    hintText: 'Enter new price',
                    obsecureText: false,
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Container(
                    // frame1029ey (1:1672)
                    margin: EdgeInsets.fromLTRB(
                        25 * fem, 0 * fem, 10 * fem, 0 * fem),
                    width: 151 * fem,

                    decoration: BoxDecoration(
                      //color: Color(0xffed9b11),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(90 * fem),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          if(formState.currentState!.validate()){
                          updateMenuItem();
                          }
                          else {

                          }
                        },
                        child: Text(
                          'Update Item',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Everett',
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3529411765 * ffem / fem,
                            letterSpacing: -0.17 * fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // frame1029ey (1:1672)
                    margin: EdgeInsets.fromLTRB(
                        25 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: 151 * fem,

                    decoration: BoxDecoration(
                      //color: Color(0xffed9b11),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(90 * fem),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          //confirmation
                          deleteItem();
                        }
                        ,
                        child: Text(
                          'Delete Item',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Everett',
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3529411765 * ffem / fem,
                            letterSpacing: -0.17 * fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}