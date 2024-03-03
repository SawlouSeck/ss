import 'package:flutter/material.dart';
import 'package:examl3gl/home/home.dart';

void main() {
  runApp(const MyApp());
}
class  MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'YOUR_WEATHER_2.0',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

