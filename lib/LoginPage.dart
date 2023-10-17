
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:food_delivery_app_v3/AddRestaurantPage.dart';
import 'package:food_delivery_app_v3/HomePage.dart';
import 'package:food_delivery_app_v3/MyTextField.dart';
import 'package:food_delivery_app_v3/RestaurantOwnerHomePage.dart';
import 'package:food_delivery_app_v3/SignUpPage.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';
import 'package:food_delivery_app_v3/utils.dart';
final firestore = FirebaseFirestore.instance;

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formfield = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;



  @override
  Widget build(BuildContext context) {

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
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                          width: 151*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffed9b11),
                            borderRadius: BorderRadius.circular(90*fem),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
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
                        Container(
                          // frame1032Ts (1:1674)
                          width: 174*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(90*fem),
                          ),
                          child: Center(
                            child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), ) );
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
                                  color: Color(0xffca7816),
                                ),
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
                              hintText: 'Enter username',
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
                          /*Container(
                            // forgotpasswordR29 (1:1682)
                            margin: EdgeInsets.fromLTRB(225*fem, 0*fem, 0*fem, 0*fem),

                            child: TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AddRestaurantPage(), ) );
                              },
                              child: Text(
                                'Forgot Password?',
                                textAlign: TextAlign.right,
                                style: SafeGoogleFont (
                                  'Everett',
                                  fontSize: 17*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3529411765*ffem/fem,
                                  letterSpacing: -0.17*fem,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff6a788a),
                                  decorationColor: Color(0xff6a788a),
                                ),
                              ),
                            ),
                          ),*/
  /*                        Container(

                            // usernamegoK (1:1680)
                            margin: EdgeInsets.fromLTRB(200*fem, 0*fem, 0*fem, 0*fem),
                            child: Text(
                              'Forgot password?',
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
*/
  /*                        TextButton(
                            onPressed: onPressed,
                            child: Text(
                                'Next',
                            ),
                          ),
    */


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
                        //color: Color(0x4ced9b11),
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(230*fem),
                      ),
                      child: Container(
                        // frame1029ey (1:1672)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                        width: 151*fem,
                        height: double.infinity,
                        decoration: BoxDecoration (
                          //color: Color(0xffed9b11),
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(90*fem),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () async {
                              CollectionReference customerCollection1 =
                              FirebaseFirestore.instance.collection('customer');
                              QuerySnapshot customerSnapshot1 = await customerCollection1
                                  .where('Username', isEqualTo: usernameController.text).where('Password',isEqualTo:passwordController.text  )
                                  .get();
                              CollectionReference customerCollection2 =
                              FirebaseFirestore.instance.collection('driver');
                              QuerySnapshot customerSnapshot2 = await customerCollection2
                                  .where('Username', isEqualTo: usernameController.text).where('Password',isEqualTo:passwordController.text  )
                                  .get();
                              CollectionReference customerCollection3 =
                              FirebaseFirestore.instance.collection('restaurant owner');
                              QuerySnapshot customerSnapshot3 = await customerCollection3
                                  .where('Username', isEqualTo: usernameController.text).where('Password',isEqualTo:passwordController.text  )
                                  .get();
                              if(_formfield.currentState!.validate()){
                                if(customerSnapshot1.docs.isNotEmpty
                                ){ logedinUsername = usernameController.text;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Welcome our customers')));
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(), ) );
                                }
                                else if(customerSnapshot2.docs.isNotEmpty
                                ){ logedinUsername = usernameController.text;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Welcome our Driver')));
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(), ) );
                                }
                                else if(customerSnapshot3.docs.isNotEmpty
                                ){ logedinUsername = usernameController.text;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Welcome Restaurant Owner')));
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(), ) );
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantOwnerHomePage(), ) );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('username or password is incorrect')));
                                }
                              }
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
  }
}