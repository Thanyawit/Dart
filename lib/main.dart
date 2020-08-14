import 'package:flutter/material.dart';
import 'package:myapp/screens/login.dart';

main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ครุภัณฑ์',
      home: Login(),
      
    );
  }
}