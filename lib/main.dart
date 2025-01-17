import 'package:flutter/material.dart';
import 'package:bmr_calcultor/claculator.dart';
import 'package:bmr_calcultor/result.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const calculator(),
      routes: {
        "result": (context) =>const result(),
      },
    );
  }
}
