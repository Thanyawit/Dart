import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Datauser extends StatefulWidget {
  @override
  _DatauserState createState() => _DatauserState();
}

class _DatauserState extends State<Datauser> {
  String nameUser, userName, pass, status;
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
      pass = preferences.getString('Pass');
      status = preferences.getString('Status');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
      ),
      body: Stack(
        children: <Widget>[
          text1(),
          name(),
          text2(),
          user(),
          text3(),
          password(),
          text4(),
          statuss()
        ],
      ),
    );
  }
  Widget text1() => Container(
        margin: EdgeInsets.only(top: 50, left: 25),
        child: Text(
          'ชื่อ-นามสกุล:',
          style: TextStyle(fontSize: 24.0),
        ),
      );
  
  Widget text2() => Container(
        margin: EdgeInsets.only(top: 150, left: 25),
        child: Text(
          'ผู้ใช้:',
          style: TextStyle(fontSize: 24.0),
        ),
      );
  
  Widget text3() => Container(
        margin: EdgeInsets.only(top: 250, left: 25),
        child: Text(
          'รหัสผ่าน:',
          style: TextStyle(fontSize: 24.0),
        ),
      );
  
  Widget text4() => Container(
        margin: EdgeInsets.only(top: 350, left: 25),
        child: Text(
          'สถานะ:',
          style: TextStyle(fontSize: 24.0),
        ),
      );
  
  Widget statuss() => Container(
        margin: EdgeInsets.only(top: 400, left: 25),
        child: Text(
          '$status',
          style: TextStyle(fontSize: 24.0,color: Colors.deepOrangeAccent),
        ),
      );

  Widget password() => Container(
        margin: EdgeInsets.only(top: 300, left: 25),
        child: Text(
          '$pass',
          style: TextStyle(fontSize: 24.0,color: Colors.deepOrangeAccent),
        ),
      );
  Widget user() => Container(
        margin: EdgeInsets.only(top: 200, left: 25),
        child: Text(
          '$userName',
          style: TextStyle(fontSize: 24.0,color: Colors.deepOrangeAccent),
        ),
      );
  Widget name() => Container(
        margin: EdgeInsets.only(top: 100, left: 25),
        child: Text(
          '$nameUser',
          style: TextStyle(fontSize: 24.0,color: Colors.deepOrangeAccent),
        ),
      );
}
