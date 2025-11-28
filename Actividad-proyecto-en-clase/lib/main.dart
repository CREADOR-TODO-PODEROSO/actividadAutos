import 'package:flutter/material.dart';
import 'package:tu_app_carros/screen/lista_auntos.dart';

void main() => runApp(const CarrosDeAndarApp());

class CarrosDeAndarApp extends StatelessWidget {
  const CarrosDeAndarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lista de carros',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const ListaCarrosScreen(),
    );
  }
}
