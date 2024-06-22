import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice6/main.dart';
import 'package:practice6/screens/to_do_screen.dart';

class MyGoals extends StatefulWidget {
  MyGoals({super.key});

  @override
  State<MyGoals> createState() => _MyGoalsState();
}

class _MyGoalsState extends State<MyGoals> {
  final _textEditingController = TextEditingController();

  // String _enteredName = '';
  List<String> _titles = ['Пример'];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textEditingController.dispose();
    super.dispose();
  }

  Widget _ListWidget() {
    return Column(
      children: _titles
          .map((item) => ListTile(
                title: TextField(
                  controller: TextEditingController(text: (item)),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      item = value;
                      // _titles.insert(_titles.indexOf(item), value);
                      // _titles.removeAt(_titles.indexOf(item)+1);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Перемены - это хорошо, а пустая строка - не очень. Введите текст, пожалуйста:)'),
                        ),
                      ); // Add
                      // ScaffoldMessenger.of(context).showMaterialBanner(
                      //   MaterialBanner(
                      //     actions: [],
                      //     content: Text('Перемены - это хорошо, а пустая строка - не очень. Введите текст, пожалуйста:)'),
                      //   ),
                      // );
                    }
                  },
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  textFields();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => textFields()),
                  //   //   CHANGE!
                  // );
                },
                onLongPress: () {
                  _deleteGoal(_titles.indexOf(item));
                },
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
          ),
          _ListWidget(),

          //     _titles.map((item) => ListTile(
          //     title: TextField(
          //     controller: TextEditingController(text: (item)),
          //     onChanged: (value) {
          //     item = value;
          //     },
          //     ),
          //       trailing: Icon(Icons.arrow_forward_ios),
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => ToDoScreen(id: 0)),
          //           //   CHANGE!
          //         );
          //       },
          //
          //               ],
          //               .toList();
          //             ),
          //
          //           },
          //         );
          //       }
          //   ),
          // ]
          // ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     // Navigator.pop(context);
          //     _addGoal();
          //   },
          //   child: const Text('+'),
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Добавить'),
                  content: TextField(controller: _textEditingController),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        if (_textEditingController.text.isNotEmpty) {
                          _addGoal();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Пустая строка - это не цель. Введите текст, пожалуйста:)'),
                            ),
                          );
                        }
                      },
                      child: Text('Ок'),
                    ),
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _addGoal() {
    setState(() {
      _titles.add(_textEditingController.text);
      _textEditingController.clear();
    });
  }

  void _deleteGoal(int index) {
    setState(() {
      _titles.removeAt(index);
    });
  }

  // ListTile _addGoals(){
  //   return ListTile(
  //       title: Text(_enteredName),
  //       trailing: Icon(Icons.arrow_forward_ios),
  //       onTap: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => ToDoScreen(id: 0)),
  //           //   CHANGE!
  //         );
  //       },
  //       onLongPress: () {
  //         showDialog(
  //           context: context,
  //           builder: (context) {
  //             return AlertDialog(
  //               title: Text('Введите название'),
  //               content: TextField(
  //                 controller: _textEditingController,
  //                 decoration: InputDecoration(
  //                   hintText: 'Название',
  //                   border: InputBorder.none,
  //                 ),
  //               ),
  //               actions: [
  //                 TextButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                     setState(() {
  //                       _enteredName = _textEditingController.text;
  //                       _textEditingController.clear();
  //                     });
  //                   },
  //                   child: Text('OK'),
  //                 ),
  //               ],
  //             );
  //           },
  //         );
  //       }
  //   );
  // }

  Widget textFields() {
    return SingleChildScrollView(
      child: (Container(
        child: TextField(),
      )),
    );
  }

//   управление состоянием экранов, смена виджетов с использованием одного Scaffold!!!!!!!!!
}
