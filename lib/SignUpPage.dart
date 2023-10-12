
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/AddRestaurantPage.dart';
import 'package:food_delivery_app_v3/LoginPage.dart';
import 'package:food_delivery_app_v3/MyTextField.dart';
import 'package:food_delivery_app_v3/sql.dart';
import 'package:food_delivery_app_v3/userDetails.dart';
import 'package:food_delivery_app_v3/utils.dart';

import 'Details.dart';

enum userRoleEnum {Customer, Driver, RestaurantOwner}

class SignUpPage extends StatefulWidget{
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formfield = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  userRoleEnum? _userRoleEnum;
  bool passToggle = true;
  UserDetails userDetails = UserDetails();
  SqlDb sqlDb = SqlDb();
  //get onPressed => null;



  @override
  Widget build(BuildContext context) {
     // sqlDb = SqlDb().intialDb();
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
        /*appBar: AppBar(
          centerTitle: true,
          title: Text(
              'Side dish'
          ),
          backgroundColor: Colors.blue,

        ),*/
        body: Container(

            child: SingleChildScrollView(
              child: Container(

                // loginYrD (1:1668)
                padding: EdgeInsets.fromLTRB(16*fem, 0*fem, 16*fem, 8*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(46*fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupyeedrdw (AdWRrs2GpqAfzRzUxJyEeD)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 124*fem, 21*fem),
                      width: 224*fem,
                      height: 66*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // welcomeAuX (1:1669)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 143*fem,
                                height: 46*fem,
                                child: Text(
                                  'Welcome!',
                                  style: SafeGoogleFont (
                                    'Everett',
                                    fontSize: 36*ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2777777778*ffem/fem,
                                    letterSpacing: -0.72*fem,
                                    color: Color(0xff292d32),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // signuporlogintoyouraccount19T (1:1670)
                            left: 0*fem,
                            top: 43*fem,
                            child: Align(
                              child: SizedBox(
                                width: 224*fem,
                                height: 23*fem,
                                child: Text(
                                  'Sign up or Login to your Account',
                                  style: SafeGoogleFont (
                                    'Everett',
                                    fontSize: 17*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3529411765*ffem/fem,
                                    letterSpacing: -0.17*fem,
                                    color: Color(0xff6a788a),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(

                      // frame74rvm (1:1671)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 24*fem),
                      padding: EdgeInsets.fromLTRB(10*fem, 10*fem, 13*fem, 10*fem),
                      width: double.infinity,
                      height: 63*fem,
                      decoration: BoxDecoration (
                        color: Color(0x4ced9b11),
                        borderRadius: BorderRadius.circular(230*fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // frame1029ey (1:1672)

                            width: 174*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(90*fem),
                            ),
                            child: Center(
                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), ) );
                                },
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Everett',
                                    fontSize: 17*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3529411765*ffem/fem,
                                    letterSpacing: -0.17*fem,
                                    color: Color(0xffca7816),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // frame1032Ts (1:1674)

                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                            width: 151*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              color: Color(0xffed9b11),
                              borderRadius: BorderRadius.circular(90*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Everett',
                                  fontSize: 17*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3529411765*ffem/fem,
                                  letterSpacing: -0.17*fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // username text + username textField + password text + password textfield
                      child: Form(
                        key: _formfield,
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // usernamegoK (1:1680)

                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 250*fem, 6*fem),
                              child: Text(
                                'Full name',
                                style: SafeGoogleFont (
                                  'Everett',
                                  fontSize: 17*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3529411765*ffem/fem,
                                  letterSpacing: -0.17*fem,
                                  color: Color(0xff292d32),
                                ),
                              ),
                            ),
                            Container(
                              child: MyTextField(
                                controller: fullNameController,
                                hintText: 'Enter Full Name',
                                obsecureText: false,
                              ),
                            ),

                            Container(

                              // usernamegoK (1:1680)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 250*fem, 6*fem),
                              child: Text(
                                'Username',
                                style: SafeGoogleFont (
                                  'Everett',
                                  fontSize: 17*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3529411765*ffem/fem,
                                  letterSpacing: -0.17*fem,
                                  color: Color(0xff292d32),
                                ),
                              ),
                            ),
                            Container(
                              child: MyTextField(
                                controller: usernameController,
                                hintText: 'Enter Username',
                                obsecureText: false,
                              ),
                            ),
                            Container(

                              // usernamegoK (1:1680)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 250*fem, 6*fem),
                              child: Text(
                                'Password',
                                style: SafeGoogleFont (
                                  'Everett',
                                  fontSize: 17*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3529411765*ffem/fem,
                                  letterSpacing: -0.17*fem,
                                  color: Color(0xff292d32),
                                ),
                              ),
                            ),
                            Container(
                              child: MyTextField(
                                controller: passwordController,
                                hintText: 'Enter password',
                                obsecureText: true,
                              ),
                            ),

                            Container(

                              // usernamegoK (1:1680)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 220*fem, 6*fem),
                              child: Text(
                                'Phone Number',
                                style: SafeGoogleFont (
                                  'Everett',
                                  fontSize: 17*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3529411765*ffem/fem,
                                  letterSpacing: -0.17*fem,
                                  color: Color(0xff292d32),
                                ),
                              ),
                            ),
                            Container(
                              child: MyTextField(
                                controller: phoneController,
                                hintText: 'Enter phone number',
                                obsecureText: false,
                              ),
                            ),

                            
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<userRoleEnum>(
                                      //tileColor: Color(0x4ced9b11),
                                    tileColor: Colors.amber,
                                      dense: true,
                                      contentPadding: EdgeInsets.all(0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      value: userRoleEnum.Customer,
                                      groupValue: _userRoleEnum,
                                      title: Text(userRoleEnum.Customer.name),
                                      onChanged: (val){
                                        setState(() {
                                          _userRoleEnum = val;
                                        });
                                      }
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<userRoleEnum>(
                                    //tileColor: Color(0x4ced9b11),
                                      tileColor: Colors.amber,
                                      dense: true,
                                      contentPadding: EdgeInsets.all(0.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      value: userRoleEnum.Driver,
                                      groupValue: _userRoleEnum,
                                      title: Text(userRoleEnum.Driver.name),
                                      onChanged: (val){
                                        setState(() {
                                          _userRoleEnum = val;
                                        });
                                      }
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<userRoleEnum>(
                                    //tileColor: Color(0x4ced9b11),
                                      tileColor: Colors.amber,
                                      //  activeColor: Colors.blue,
                                      dense: true,
                                      contentPadding: EdgeInsets.all(0.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      value: userRoleEnum.RestaurantOwner,
                                      groupValue: _userRoleEnum,
                                      //title: Text(userRoleEnum.RestaurantOwner.name),
                                      title: Text('Restaurant Owner'),
                                      onChanged: (val){
                                        setState(() {
                                          _userRoleEnum = val;
                                        });
                                      }
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),

                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        // frame74rvm (1:1671)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 24*fem),
                        padding: EdgeInsets.fromLTRB(10*fem, 10*fem, 13*fem, 10*fem),
                        width: double.infinity,
                        height: 63*fem,
                        decoration: BoxDecoration (
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(230*fem),
                        ),
                        child: Container(
                          // frame1029ey (1:1672)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                          width: 151*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(90*fem),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () async {
                               // sqlDb = SqlDb().intialDb();
                                if(_formfield.currentState!.validate()){
                                  /*ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Proccessing Data')));*/
                                  userDetails.fullName = fullNameController.text;
                                  userDetails.username = usernameController.text;
                                  userDetails.password = passwordController.text;
                                  userDetails.phoneNumber = phoneController.text;
                                  userDetails.userRole = _userRoleEnum!;
                                  /*String sqlQuery = "";
                                  if (_userRoleEnum == userRoleEnum.Customer){
                                    sqlQuery = "INSERT INTO 'Customer'('Full_Name', 'Username', 'Phone_Number', 'Password')"+
                                    "VALUES ('"+fullNameController.text+"','"+ usernameController.text+"', '"+phoneController.text+"', '"+passwordController.text+"')" ;
                                  }else
                                  if (_userRoleEnum == userRoleEnum.Driver){
                                    sqlQuery = 'INSERT INTO Delivery_Guy(Full_Name, Username, Phone_Number, Password)'+
                                        'VALUES ('+fullNameController.text+','+ usernameController.text+', '+phoneController.text+', '+passwordController.text+',)' ;
                                  } else if (_userRoleEnum == userRoleEnum.RestaurantOwner){
                                    sqlQuery = 'INSERT INTO Restaurant_Owner(ID,Full_Name, Username, Phone_Number, Password)'+
                                        'VALUES ('+ '1'+fullNameController.text+','+ usernameController.text+', '+phoneController.text+', '+passwordController.text+',)' ;
                                  } else null;
                                  sqlDb.insertData(sqlQuery );*/
                                  CollectionReference customerCollection1 =
                                  FirebaseFirestore.instance.collection('customer');
                                  QuerySnapshot customerSnapshot1 = await customerCollection1
                                      .where('Username', isEqualTo: usernameController.text)
                                      .get();
                                  CollectionReference customerCollection2 =
                                  FirebaseFirestore.instance.collection('driver');
                                  QuerySnapshot customerSnapshot2 = await customerCollection2
                                      .where('Username', isEqualTo: usernameController.text)
                                      .get();
                                  CollectionReference customerCollection3 =
                                  FirebaseFirestore.instance.collection('restaurant owner');
                                  QuerySnapshot customerSnapshot3 = await customerCollection3
                                      .where('Username', isEqualTo: usernameController.text)
                                      .get();
                                  if(customerSnapshot3.docs.isEmpty && customerSnapshot2.docs.isEmpty && customerSnapshot1.docs.isEmpty  )
                                  if (_userRoleEnum == userRoleEnum.Customer){
                                    CollectionReference customerCollection =
                                    FirebaseFirestore.instance.collection('customer');
                                    QuerySnapshot customerSnapshot = await customerCollection
                                        .where('Username', isEqualTo: usernameController.text)
                                        .get();


                                    await firestore.collection('customer').add({
                                      'Full name': fullNameController.text,
                                      'Username': usernameController.text,
                                      'Password': passwordController.text,
                                      'Phone number': phoneController.text,
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Welcome to our customers')));
                                  }
                                  else if (_userRoleEnum == userRoleEnum.Driver){
                                    await firestore.collection('driver').add({
                                      'Full name': fullNameController.text,
                                      'Username': usernameController.text,
                                      'Password': passwordController.text,
                                      'Phone number': phoneController.text,
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Welcome to our drivers')));
                                  }
                                  else if (_userRoleEnum == userRoleEnum.RestaurantOwner){
                                    await firestore.collection('restaurant owner').add({
                                      'Full name': fullNameController.text,
                                      'Username': usernameController.text,
                                      'Password': passwordController.text,
                                      'Phone number': phoneController.text,
                                    });
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddRestaurantPage(), ) );
                                  }
                                  else {}

                                  //Navigator.push(context, MaterialPageRoute(builder: (context){return Details(userDetails: userDetails);}));
                                }
                              },
                              child: Text(
                                'Sign Up',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Everett',
                                  fontSize: 17*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3529411765*ffem/fem,
                                  letterSpacing: -0.17*fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        )
    );
    throw UnimplementedError();
  }
}