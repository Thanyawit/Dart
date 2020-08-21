import 'package:flutter/material.dart';
import 'package:myapp/utility/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Durable extends StatefulWidget {
  @override
  _DurableState createState() => _DurableState();
}

class _DurableState extends State<Durable> {
  String durableCodeno,
      durableName,
      durableBrand,
      durableMachinenumber,
      durableStatus,
      durableResponsible,
      durablePosition;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      durableCodeno = preferences.getString('code_no');
      durableName = preferences.getString('name');
      durableBrand = preferences.getString('brand');
      durableMachinenumber = preferences.getString('machine_number');
      durableStatus = preferences.getString('status');
      durableResponsible = preferences.getString('responsible');
      durablePosition = preferences.getString('position');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ครุภัณฑ์ที่รับผิดชอบ'),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showText('ครุภัณฑ์'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
