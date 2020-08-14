import 'dart:io';

import 'package:flutter/material.dart';
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
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าหลัก'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () => signOut()),
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showuser(),
            durable(),
            durebleevent(),
            alert(),
          ],
        ),
      );

  ListTile durebleevent() {
    return ListTile(
            leading: Icon(Icons.event_note),
            title: Text('ครุภัณฑ์ที่รับผิดชอบ'),
          );
  }

  ListTile alert() => ListTile(
        leading: Icon(Icons.near_me),
        title: Text('แจ้งเตือน'),
      );

  ListTile durable() {
    return ListTile(
      leading: Icon(Icons.event_available),
      title: Text('ตรวจนับครุภัณฑ์'),
    );
  }

  UserAccountsDrawerHeader showuser() {
    return UserAccountsDrawerHeader(
      accountName: Text('Name: $nameUser'),
      accountEmail: Text('User: $userName'),
    );
  }
}
