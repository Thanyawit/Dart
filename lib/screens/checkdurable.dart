import 'package:flutter/material.dart';

class Checkdarable extends StatefulWidget {
  @override
  _CheckdarableState createState() => _CheckdarableState();
}

class _CheckdarableState extends State<Checkdarable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตรวจนับครุภัณฑ์'),
      ),
      body: Column(
        children: <Widget>[scan()],
      ),
    );
  }

  Row scan(){
    return Row(children: <Widget>[],);
  }
}
