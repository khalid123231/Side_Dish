

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/orderC.dart';

import 'khalids material/global variabls/v.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  late List<Map<String, dynamic>> documents ;
   List<String> item = [];
  List<int> price = [];
   List <int>count = [];
  int counter =0;
  bool islooded = false;
  bool isNotEmpty = false;
  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('menu items').where('Restaurant address', isEqualTo: restaurantAddress).get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {
      documents = temp;
      islooded =true;
    });





  }
  void addToCart(int index){
    bool x = true;
    if(item.isEmpty){
      setState(() {
        item.add(documents[index]['item name']);
        price.add(int.parse(documents[index]['price']));
        count.add(1);
        counter++;
        print(item);

        x= false;
      });


    }
    if(x){
      for(int i = 0 ; i<counter ;i++){
        if(documents[index]['item name'] ==item[i]){
          setState(() {
            price[i]+=int.parse(documents[index]['price']);

            count[i]++;

            x= false;
          });

          break;

        }
      }}
    if(x){
      setState(() {
        item.add(documents[index]['item name']);
        count.add(1);
        price.add(int.parse(documents[index]['price']));
        counter++;

      });

    }
    setState(() {
      isNotEmpty= item.isNotEmpty;
    });
    print(item);
    print(count);
    print(counter);

    print(price);

  }
  void removeFromCart(int index ){
    int w = item.indexOf(documents[index]['item name']);
    if(count[w]!=1){
      setState(() {
        count[w]--;
        price[w]-=int.parse(documents[index]['price']);
      });


    }else{
      setState(() {
        item.removeAt(w);
        count.removeAt(w);
        price.removeAt(w);
        counter--;
      });


    }
    print(price);
    print(item);
    print(count);

  }
  void initState() {
    super.initState();

    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: Visibility(child: FloatingActionButton.extended(backgroundColor: Colors.blueAccent,onPressed: (){
      prices = price;
      items=item;
      counts=count;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderC(),
          )) ;
    }, label: Text('cart : ${counter}') , icon: Icon(Icons.shopping_cart),), visible: isNotEmpty ,) ,
      appBar: AppBar(title: Text(restaurantName +' menu'),),
      body: SingleChildScrollView( child: SizedBox(height:500 ,child: islooded?ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: documents.length, // Replace with the actual number of items
        itemBuilder: (context, index) {
        int w=   item.indexOf(documents[index]['item name']);
        int q=0;
        bool sq;
          if(w==-1){
            sq=true;
          }else{
            sq=false;
            q=count[w];
          }



          return Container(  decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
          ),child: ListTile(subtitle: Text(
            'price'+' : ' +  documents[index]['price'],
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),trailing: sq? IconButton(onPressed: () {
            addToCart(index);
          }, icon: Icon(Icons.add),): Row(mainAxisSize: MainAxisSize.min, children: [IconButton(onPressed: () {
            addToCart(index);
          }, icon: Icon(Icons.add),), Text('${q}'), IconButton(onPressed: () {
            removeFromCart(index);
          }, icon: Icon(Icons.remove),)],),

            leading:ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                documents[index]['menu item photo'],
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),tileColor: Colors.grey[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
            ),

            title: Text(
              documents[index]['item name'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),

            ),
          ));
        },
      ):Text('no data') ,)),
    );
  }
}
