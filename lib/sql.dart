import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb{
  static Database? _db;
  Future<Database?> get db async{
    if(_db == Null){
      _db = await intialDb();
      return _db;
    } else{
      return _db;
    }
  }

  intialDb() async{
    print("db");
    String databasepath = await getDatabasesPath();
    String path = join(databasepath,'anything.db');
    Database mydb = await openDatabase(path, onCreate:_onCreate);
    print("db2");
    return mydb;
  }
  _onCreate( Database db, int version) async{
   await db.execute('''
   
   CREATE TABLE 'Customer'
(
  'ID' INTEGER NOT NULL AUTOINCREMENT,
  'Full_Name' VARCHAR NOT NULL,
  'Phone_Number' VARCHAR NOT NULL,
  'Username' VARCHAR NOT NULL,
  'Password' VARCHAR NOT NULL,
  'PRIMARY KEY (ID)
)
   
   ''');

   db.execute('''
   
   CREATE TABLE Customer_address
(
  Cust_Address VARCHAR NOT NULL,
  City VARCHAR NOT NULL,
  ID VARCHAR NOT NULL,
  PRIMARY KEY (Cust_Address, ID),
  FOREIGN KEY (ID) REFERENCES Customer(ID)
)

   
   ''');
   db.execute('''
   
   CREATE TABLE Restaurant_Owner
(
  ID VARCHAR NOT NULL,
  Full_Name VARCHAR NOT NULL,
  User_Name VARCHAR NOT NULL,
  Phone_number VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  PRIMARY KEY (ID)
)

   
   ''');
   db.execute('''
   CREATE TABLE Delivery_Guy
(
  Delviery_ID VARCHAR NOT NULL,
  Full_Name VARCHAR NOT NULL,
  Username VARCHAR NOT NULL,
  phone_number VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  PRIMARY KEY (Delviery_ID)
)
   
   
   
   ''');
   db.execute('''
   
   CREATE TABLE Restaurant
(
  Rest_ID VARCHAR NOT NULL,
  Name VARCHAR NOT NULL,
  Phone_Number VARCHAR NOT NULL,
  Logo VARCHAR NOT NULL,
  ID VARCHAR NOT NULL,
  PRIMARY KEY (Rest_ID),
  FOREIGN KEY (ID) REFERENCES Restaurant_Owner(ID)
)

   
   ''');
   db.execute('''
   
   CREATE TABLE Restaurant_Address
(
  Rest_Address VARCHAR NOT NULL,
  City VARCHAR NOT NULL,
  Rest_ID VARCHAR NOT NULL,
  PRIMARY KEY (Rest_Address, Rest_ID),
  FOREIGN KEY (Rest_ID) REFERENCES Restaurant(Rest_ID)
)

   
   ''');
   db.execute('''
   
      CREATE TABLE Menu_item
(
  ID VARCHAR NOT NULL,
  Name VARCHAR NOT NULL,
  Price INT NOT NULL,
  Rest_ID VARCHAR NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (Rest_ID) REFERENCES Restaurant(Rest_ID)
)

   
   ''');

   db.execute('''
   
   
   CREATE TABLE Order
(
  Order_ID VARCHAR NOT NULL,
  Total INT NOT NULL,
  delivery_cost INT NOT NULL,
  Status VARCHAR NOT NULL,
  Cust_Address VARCHAR NOT NULL,
  ID VARCHAR NOT NULL,
  Rest_Address VARCHAR NOT NULL,
  Rest_ID VARCHAR NOT NULL,
  Delviery_ID VARCHAR NOT NULL,
  PRIMARY KEY (Order_ID),
  FOREIGN KEY (Cust_Address, ID) REFERENCES Customer_address(Cust_Address, ID),
  FOREIGN KEY (Rest_Address, Rest_ID) REFERENCES Restaurant_Address(Rest_Address, Rest_ID),
  FOREIGN KEY (Delviery_ID) REFERENCES Delivery_Guy(Delviery_ID)
)
   ''');
   db.execute('''
   
   CREATE TABLE Order_menu
(
  Order_ID VARCHAR NOT NULL,
  ID VARCHAR NOT NULL,
  FOREIGN KEY (Order_ID) REFERENCES Order(Order_ID),
  FOREIGN KEY (ID) REFERENCES Menu_item(ID)
)
   
   
   ''');
   db.execute('''
   
   CREATE TABLE Tags
(
  Tag VARCHAR NOT NULL,
  Rest_ID VARCHAR NOT NULL,
  PRIMARY KEY (Tag, Rest_ID),
  FOREIGN KEY (Rest_ID) REFERENCES Restaurant(Rest_ID)
);
   
   ''');



  }
  readData(String sql) async{
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }
  insertData(String sql) async{
    print(sql );

    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    print(sql );
    print("db3");
    return response;
  }

  updateData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }
  deleteData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }





}
