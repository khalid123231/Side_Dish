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
  int s =0;
  bool f = false;
   bool islooded = true;
  late List<Map<String, dynamic>> documents ;
  Future<void> fetchData() async {


    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('order').where('Status',isNotEqualTo: 'delivered' ).where('Username', isEqualTo:logedinUsername ).get();
    prices.forEach((element) { s+=element;});
    f =querySnapshot.docs.isEmpty;
    setState(() {

      islooded =true;
    });



  }
  void initState() {
    super.initState();
    prices.forEach((element) { s+=element;});


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar:AppBar(),floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended( backgroundColor: Colors.blueAccent, onPressed: () async {
        print(logedinUsername);
       CollectionReference customerCollection1 =
        FirebaseFirestore.instance.collection('order');
        QuerySnapshot customerSnapshot1 = await customerCollection1
            .where('Status', isEqualTo:"sent" ).where('Username' , isEqualTo: logedinUsername )
            .get();
        QuerySnapshot customerSnapshot2 = await customerCollection1
            .where('Status', isEqualTo:"on way" ).where('Username' , isEqualTo: logedinUsername )
            .get();
        QuerySnapshot customerSnapshot3 = await customerCollection1
            .where('Status', isEqualTo:"accepted" ).where('Username' , isEqualTo: logedinUsername )
            .get();
        if(customerSnapshot3.docs.isEmpty && customerSnapshot1.docs.isEmpty && customerSnapshot2.docs.isEmpty){
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
          'Restaurant Name': restaurantName,
          'logo':logo,
          'Restaurant owner username':ownerName,

        });
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('the order has been placed')));
        sum=0;}else{
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('you already have an order')));
        }
      }, label: Text('place order'),), body: SingleChildScrollView( child: Column(
          children: [SizedBox(height:400 ,child: islooded?ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items.length, // Replace with the actual number of items
            itemBuilder: (context, index) {



              return Container(  decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
              ),child: ListTile(subtitle: Text(
                '${prices[index]}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),



                title: Text(
                  items[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ), trailing: Text('${counts[index]}'),leading:ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      logos[index],
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  )
              ));
            },
          ):Text('no data') ,), Text('total ${s}')],
        ),
      ),
    );
  }
}
