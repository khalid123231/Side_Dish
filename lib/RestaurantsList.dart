import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/khalids%20material/SBar.dart';
import 'package:food_delivery_app_v3/khalids%20material/global%20variabls/v.dart';

class RestaurantList extends StatefulWidget {


  RestaurantList({super.key}) {
    // TODO: implement RestaurantList

  }

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  String selectedChoice ='';

  String w ='';
  callback(varw){
    setState(() {
      w=varw;
    });
    if(w!=''){
   fetchData1();}
    else{fetchData();}
  }

  late List<Map<String, dynamic>> documents ;
  bool islooded = false;


  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('restaurant').get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {
      selectedChoice='all';
      documents = temp;
      islooded =true;
    });



  }
  Future<void> fetchData1() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('restaurant').where('Restaurant name'  , isEqualTo: w ).get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {

      documents = temp;
      islooded =true;
    });



  }
  Future<void> fetchData2() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('restaurant').where('has offer'  , isEqualTo: true ).get();
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
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(


          children: [ SBar1(callbackfunction: callback,),
            Text('restarents', style: TextStyle(
              fontSize: 32, // Adjust the font size to make it big
              fontWeight: FontWeight.bold, // Make the text bold
              fontFamily: 'Pacifico', // Use a stylish font
              fontStyle: FontStyle.normal, // Make the text italic
              color: Colors.blue, // Use a stylish color
            ), textAlign: TextAlign.left,) ,SizedBox(width: 500, height: 100,child:Padding( child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ChoiceChip(selectedColor:  Color(0xffed9b11),
                  label: Text('all'),
                  selected: selectedChoice == 'all',
                  onSelected: (bool selected) {
                    setState(() {
                      fetchData();
                      selectedChoice = (selected ? 'all' : null)!;

                    });
                  },
                )  ,SizedBox(width: 8),
                ChoiceChip(selectedColor:  Color(0xffed9b11),
                  label: Text('offers'),
                  selected: selectedChoice == 'offers',
                  onSelected: (bool selected) {
                    setState(() {
                      fetchData2();
                      selectedChoice = (selected ? 'offers' : null)!;
                    });
                  },
                ),

              ],
            ), padding:   EdgeInsets.symmetric(horizontal: 40.0),)), SizedBox(height:400 ,child: islooded?ListView.builder(
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
                             'Restaurant tags':documents[index]['Restaurant tags'],
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
      ):Text('no data') ,)

          ],
        ),
      ),
    );
  }
}
