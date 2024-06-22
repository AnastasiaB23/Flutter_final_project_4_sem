import 'package:flutter/material.dart';


class CheckboxWidget extends StatefulWidget{
  const CheckboxWidget({super.key});
  @override
  State<CheckboxWidget> createState() => _CheckboxWidget();
}

class _CheckboxWidget extends State<CheckboxWidget> {
  bool checkBValue = false;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Center(
     child:  CheckboxListTile(
        title: Text('Так держать! Только вперёд!'),
        value: checkBValue,
        onChanged: (value) {
          setState(() {
            checkBValue = value!;
          });
        }//(bool? value) {},
    ),
      ),

          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     return router.goNamed('image');
          //   },
          //   child: const Text('Вперёд!'),
          // )

    );

  }
}