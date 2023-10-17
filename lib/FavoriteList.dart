import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'khalids material/global variabls/v.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  late List<Map<String, dynamic>> documents ;
  bool islooded = false;
  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('favorites').where('Username',isEqualTo: logedinUsername ).get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {
      documents = temp;
      islooded =true;
    });



  }
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView( child: SizedBox(height:500 ,child: islooded?ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: documents.length, // Replace with the actual number of items
        itemBuilder: (context, index) {



          return Container(  decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
          ),child: ListTile(subtitle: Text(
            documents[index]['Restaurant tags'][0]+',' +  documents[index]['Restaurant tags'][1],
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

            leading:ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                documents[index]['Restaurant logo'],
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),tileColor: Colors.grey[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
            ),

            title: Text(
              documents[index]['Restaurant name'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ), trailing: IconButton(onPressed: () async {
              QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('favorites').where('Username',isEqualTo: logedinUsername ).where('Restaurant address',isEqualTo: documents[index]['Restaurant address'] ).get();
              if(querySnapshot.docs.isEmpty){
                await FirebaseFirestore.instance.collection('favorites').add({
                  'Restaurant name':documents[index]['Restaurant name'],
                  'Restaurant phone number':documents[index]['Restaurant phone number'],
                  'Restaurant city':documents[index]['Restaurant city'],
                  'Restaurant address':documents[index]['Restaurant address'],
                  'Restaurant logo':documents[index]['Restaurant logo'],
                  'Username':logedinUsername,

                });
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('the Restaurant has been added to the favorites')));

              }else{
                await querySnapshot.docs.first.reference.delete();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('the Restaurant has been removed to the favorites')));
              }



            }, icon: Icon(Icons.star),),
          ));
        },
      ):Text('no data') ,)),
    );
  }
}
