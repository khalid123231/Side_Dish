import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_v3/MenuList.dart';
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

  String searchR ='';
  callback(varw){
    setState(() {
      searchR=varw;
    });
    if(searchR!=''){
   fetchData1();}
    else{fetchData();}
  }

  late List<Map<String, dynamic>> documents ;
  bool islooded = false;
  List<String> tags = ['all', 'offers'];
  Future<void> fetchData() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('restaurant').get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>);
    });
    if(temp.isNotEmpty){
      for(int i=0; i<temp.length;i++){
        List s =temp[i]['Restaurant tags'];
        for(int j=0; j<s.length;j++){
          int x = tags.indexOf(s[j]);
          if(x==-1){
            tags.add(s[j]);
          }
        }


      }
    }
    setState(() {
      selectedChoice='all';
      documents = temp;
      islooded =true;
    });



  }

//this method gets all of the restaurants
  Future<void> fetchData4() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('restaurant').get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>);
    });
    setState(() {
      documents=[];
    });
    if(temp.isNotEmpty){
    for(int i=0; i<temp.length;i++){
      List s =temp[i]['Restaurant tags'];
      int x = s.indexOf(selectedChoice);
      if(x !=-1){
        documents.add(temp[i]);
      }


    }
    }
    setState(() {

      documents.length;
      islooded =true;
    });



  }
  //this method gets the restaurants that the user searched for
  //w is the restaurant name
  Future<void> fetchData1() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('restaurant').where('Restaurant name'  , isEqualTo: searchR ).get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {

      documents = temp;
      islooded =true;
    });



  }
  //this method gets the restaurats that have offers
  Future<void> fetchData2() async {
    List<Map<String, dynamic>> temp = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('restaurant').where('has offer'  , isEqualTo: true ).get();
    querySnapshot.docs.forEach((e) { temp.add(e.data() as Map<String, dynamic>); });
    setState(() {

      documents = temp;
      islooded =true;
    });



  }
  //first method the page runs
  @override
  void initState() {
    super.initState();

    fetchData();
  }
  //the build of the interface of the page
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(


          children: [  SBar1(callbackfunction: callback,),
            Text('restaurants', style: TextStyle(
              fontSize: 32, // Adjust the font size to make it big
              fontWeight: FontWeight.bold, // Make the text bold
              fontFamily: 'Pacifico', // Use a stylish font
              fontStyle: FontStyle.normal, // Make the text italic
              color: Colors.blue, // Use a stylish color
            ), textAlign: TextAlign.left,) ,SizedBox( height: 100,child:Padding( child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: tags.length,itemBuilder: (context, index){
              return Container(padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),child: ChoiceChip(selectedColor:  Color(0xffed9b11),
                label: Text(tags[index]),
                selected: selectedChoice ==tags[index] ,
                onSelected: (bool selected) {
                  selectedChoice = (selected ? tags[index] : null)!;
                  setState(() {
                    if(index ==0){
                    fetchData();}
                    else if(index == 1){
                      fetchData2();
                    }else{
                      fetchData4();
                    }



                  });
                },
              ));
            }), padding:   EdgeInsets.symmetric(horizontal: 40.0),)), SizedBox(height:400 ,child: islooded?ListView.builder(
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
                  // the tags of the restaurant it only shows the first two
                  documents[index]['Restaurant tags'][0]+',' +  documents[index]['Restaurant tags'][1],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                  leading:ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  //shows the logo
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
                  //opens the restaurant menu
                  onTap: (){
                  restaurantName = documents[index]['Restaurant name'];
                  restaurantAddress = documents[index]['Restaurant address'];
                  logo =documents[index]['Restaurant logo'];
                  ownerName=documents[index]['Restaurant owner username'];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuList(),
                      )) ;

                  },

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
