import 'package:flutter/material.dart';
import 'package:practice6/main.dart';



class ListWidget extends StatelessWidget {
  const ListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Dreams dream =
    myDream<Dreams>(param1: "1 тысяча шагов", param2: "Сегодня");

    return Scaffold(
      body: Center(
        child:
            Text(
              dream.goal! + ' - '  + dream.deadline! + '!',
              style: TextStyle(color: Colors.pink, fontSize: 30.0),
            )
    ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Назад'),
        )
    );
  }
}