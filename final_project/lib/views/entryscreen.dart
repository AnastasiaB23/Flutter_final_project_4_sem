import 'package:flutter/material.dart';
import 'package:practice6/views/todo_preview_screen.dart';
import 'package:practice6/views/weather_screen.dart';

import '../views/goals_screen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

TextStyle _textStyle(context) {
  return TextStyle(
    fontSize: MediaQuery.of(context).size.longestSide / 30,
    fontWeight: FontWeight.bold,
    color: Colors.black.withOpacity(0.9),
  );
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return entryScreen();
  }

  Widget entryScreen() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyGoals()),
                );
              },
              child: Container(
                color: Colors.lightBlue.shade100,
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.height / 3.6,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.flag_circle,
                    size: MediaQuery.of(context).size.longestSide / 25,
                    weight: 0.9,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Мои цели', style: _textStyle(context)),
                ]),
              ),
            ),

            Divider(
              height: 10,
              color: Colors.white,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherPage()),
                );
              },
              child: Container(
                color: Colors.lightBlue.shade300,
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.height / 3.6,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.fitness_center,
                    size: MediaQuery.of(context).size.longestSide / 25,
                    weight: 0.9,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Мои тренировки', style: _textStyle(context)),
                ]),
              ),
            ),
            // ),
            Divider(
              height: 10,
              color: Colors.white,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ToDoCategory()),
                );
              },
              child: Container(
                color: Colors.lightBlue.shade500,
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.height / 3.6,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.list,
                    size: MediaQuery.of(context).size.longestSide / 25,
                    weight: 0.9,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Мои дела', style: _textStyle(context)),
                ]),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
