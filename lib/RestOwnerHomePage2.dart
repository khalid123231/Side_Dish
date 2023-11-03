import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/RestaurantOwnerHomePage.dart';
import 'package:food_delivery_app_v3/RestaurantOwnerOrdersPage.dart';

import 'khalids material/global variabls/v.dart';

class RestOwnerHomePage2 extends StatefulWidget{
  @override
  State<RestOwnerHomePage2> createState() => _RestOwnerHomePage2State();
}

class _RestOwnerHomePage2State extends State<RestOwnerHomePage2> {

  int curentPage = 0;
  List<Widget> pages = [ RestaurantOwnerHomePage(), RestaurantOwnerOrdersPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            Image.network("https://firebasestorage.googleapis.com/v0/b/side-dish-756b7.appspot.com/o/images%2F1697555108921?alt=media&token=d6c36055-f773-431d-adc8-bfac8eb6b691"),
            // Add some spacing between the image and the title
          ],
        ),

        title: Text("welcome " +logedinUsername),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        child: pages[curentPage],
      ),

      bottomNavigationBar: NavigationBar(destinations: const [NavigationDestination(icon:Icon(Icons.home), label: 'Home'),NavigationDestination(icon:Icon(Icons.food_bank), label: 'orders')],onDestinationSelected:(int index){
        setState(() {
          curentPage = index;
        });
      } , selectedIndex: curentPage,),

    );
  }
}