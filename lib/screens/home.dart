import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/data_model.dart';
import 'package:myapp/screens/checkdurable.dart';
import 'package:myapp/screens/durable.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/screens/datauser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nameUser, userName;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('Name');
      userName = preferences.getString('User');
    });
  }

  Future<Null> signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    // exit(0);

    MaterialPageRoute route = MaterialPageRoute(
      builder: (value) => Login(),
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าหลัก'),
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showuser(),
            user(),
            durable(),
            durebleevent(),
            alert(),
            out(),
          ],
        ),
      );

  ListTile durebleevent() {
    return ListTile(
      leading: Icon(Icons.event_note),
      title: Text('ครุภัณฑ์ที่รับผิดชอบ'),
      onTap: (){
        showdata();
      },
    );
  }
   Future<Null> showdata()async{
      String url = 'http://192.168.1.68/UngPHP3/UngPHP3/getAllData.php';
      try {
        Response response = await Dio().get(url);
        print(response);
        var result = json.decode(response.data);
        print(result);
        for (var map in result){
          Datadurable datadurable = Datadurable.fromJson(map);
          if(nameUser == datadurable.responsible){
            open(datadurable);
          }
        }
      } catch (e) {
        print(e);
      }
   }
   
    

    Future<Null> open(Datadurable datadurable)async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('id', datadurable.id);
      preferences.setString('code_no', datadurable.codeNo);
      preferences.setString('name', datadurable.name);
      preferences.setString('brand', datadurable.brand);
      preferences.setString('machine_number', datadurable.machineNumber);
      preferences.setString('status', datadurable.status);
      preferences.setString('responsible', datadurable.responsible);
      preferences.setString('position', datadurable.position);

      MaterialPageRoute route = MaterialPageRoute(builder: (value) => Durable());
      Navigator.push(context, route);

      
    }
 

  ListTile alert() => ListTile(
        leading: Icon(Icons.near_me),
        title: Text('แจ้งเตือน'),
      );

  ListTile durable() {
    return ListTile(
      leading: Icon(Icons.event_available),
      title: Text('ตรวจนับครุภัณฑ์'),onTap: (){
        MaterialPageRoute route = MaterialPageRoute(builder: (value) => Checkdarable());
        Navigator.push(context, route);
      },
    );
  }

  ListTile user() {
    return ListTile(
        leading: Icon(Icons.people),
        title: Text('ข้อมูลส่วนตัว'),
        onTap: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (value) => Datauser());
          Navigator.push(context, route);
        });
  }
  ListTile out() {
    return ListTile(
        leading: Icon(Icons.lock_open),
        title: Text('Logout'),
        onTap: () => signOut());
  }

  UserAccountsDrawerHeader showuser() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/4.jpg'),fit: BoxFit.cover
        ),
      ),
      accountName: Text('Name: $nameUser'),
      accountEmail: Text('User: $userName')
    );
  }
}
