import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/user_model.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/utility/dialog.dart';
import 'package:myapp/utility/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, MyStyle().primaryColor],
            center: Alignment(0, -0.3),
            radius: 1.0,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showlogo(),
                MyStyle().mySizebox(),
                MyStyle().showText('ครุภัณฑ์'),
                MyStyle().mySizebox(),
                userForm(),
                MyStyle().mySizebox(),
                passForm(),
                MyStyle().mySizebox(),
                login()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget login() => Container(
        width: 250.0,
        child: RaisedButton(
          color: MyStyle().darkColor,
          onPressed: () {
            print('user = $username pass = $password');
            if (username == null ||
                username.isEmpty ||
                password == null ||
                password.isEmpty) {
              print('กรุณากรอกข้อมูล');
              normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ');                  
            }else{
              loginserve();

            }
          },
          child: Text(
            'Singin',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      Future<Null> loginserve()async{
        String url = 'http://192.168.1.68/UngPHP3/UngPHP3/getUserWhereUserMaster.php?isAdd=true&username=$username';
        try {
          Response response = await Dio().get(url);
          print(response);
          if(response.toString() == 'null'){
            normalDialog(context, 'รหัสไม่ถูกต้อง');
          }
          var result = json.decode(response.data);
          print(result);
          for (var map in result) {
            Userdata userdata = Userdata.fromJson(map);
            if(password == userdata.password){
              routetor(Home(),userdata);
              
            }else{
              normalDialog(context, 'รหัสไม่ถูกต้อง');
            }
          }
        } catch (e) {
        }
      }

      Future<Null> routetor(Widget my, Userdata userdata )async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('id', userdata.id);
        preferences.setString('Name', userdata.name);
        preferences.setString('User', userdata.username);
        preferences.setString('Pass', userdata.password);
        preferences.setString('Status', userdata.status);

        
        MaterialPageRoute route = MaterialPageRoute(builder: (context) => my,);
        Navigator.pushAndRemoveUntil(context, route, (route) => false);
      }

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => username = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box, color: MyStyle().darkColor),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'Username',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
          ),
        ),
      );

  Widget passForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, color: MyStyle().darkColor),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'Password',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );
}
