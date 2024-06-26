import 'package:flutter/material.dart';
import 'package:practice6/screens/start_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Погнали!',
      home: StartScreen(),
    );
  }
}
