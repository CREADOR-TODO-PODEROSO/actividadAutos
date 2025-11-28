import 'package:flutter/material.dart';
//import 'package:tu_app_carros/screen/lista_auntos.dart';
import 'package:tu_app_carros/screen/cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartPage(),
    );
  }
}