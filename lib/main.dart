import 'package:flutter/material.dart';
import 'package:http_json_demo/screens/mainScreen.dart';

void main() {
  runApp(HttpApp());
}

class HttpApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }

}