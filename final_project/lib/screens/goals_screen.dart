import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preferences_service.dart';

class MyGoals extends StatefulWidget {
  MyGoals({super.key});

  @override
  State<MyGoals> createState() => _MyGoalsState();
}

class _MyGoalsState extends State<MyGoals> {
  final _textEditingController = TextEditingController();

  late SharedPreferencesService service;
  List<String> goals = [];

  @override
  void initState() {
    _initSharedPreferences();
    super.initState();
  }

  Future<void> _loadGoals(String buttonType) async {
    final todos = await service.getTodo(buttonType);
    setState(() {
      goals = todos;
    });
  }

  Future<void> _initSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      service = SharedPreferencesService(sharedPreferences);
      print('initSharedPrefs1');
    });
    _loadGoals('goals');
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Widget _ListWidget() {
    return Column(
      children: goals
          .map((item) => ListTile(
                title: TextField(
                  controller: TextEditingController(text: (item)),
                  onChanged: (value) async {
                    if (value.isNotEmpty) {
                      // item = value;
                      final prefs = await SharedPreferences.getInstance();
                      String key = 'todos_goals';
                      final result = prefs.getStringList(key);
                      result?.removeAt(goals.indexOf(item));
                      result?.insert(goals.indexOf(item), value);
                      await prefs.setStringList(key, result ?? []);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Перемены - это хорошо, а пустая строка - не очень. Введите текст, пожалуйста:)'),
                        ),
                      ); // Add
                    }
                  },
                ),
                trailing: Icon(Icons.check_box_outline_blank),
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Congratulations()),
                  );

                  setState(() {
                    goals.removeAt(goals.indexOf(item));
                    print('worked');
                  });

                  final prefs = await SharedPreferences.getInstance();
                  // print(currentTodos);
                  await prefs.setStringList('todos_goals', goals);
                },
                // onLongPress: ()
                // _deleteGoal(goals.indexOf(item));
                // async {
                //   setState(() {
                //     goals.removeAt(goals.indexOf(item));
                //     print('worked');
                //   });
                //
                //   final prefs = await SharedPreferences.getInstance();
                //   // print(currentTodos);
                //   await prefs.setStringList(
                //       'todos_goals', goals);
                //   Congratulations();

                // },
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // Container(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: 20,
          //     vertical: 15,
          //   ),
          // ),
          _ListWidget(),
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
                      onPressed: () async {
                        if (_textEditingController.text.isNotEmpty) {
                          final prefs = await SharedPreferences.getInstance();
                          String key = 'todos_goals';

                          await prefs.setStringList(
                              key,
                              (prefs.getStringList(key) ?? []).followedBy(
                                  [_textEditingController.text]).toList());
                          _initSharedPreferences();
                          _textEditingController.clear();
                        }
                        // _addGoal();

                        else {
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
      goals.add(_textEditingController.text);
      _textEditingController.clear();
    });
  }

  void _deleteGoal(int index) {
    setState(() {
      goals.removeAt(index);
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

  Widget Congratulations() {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          // alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Stack(

              // alignment: Alignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Lottie.asset('assets/congratulations.json'),
                Container(
                  padding: EdgeInsets.only(top: 130),
                  child: Lottie.asset('assets/checkbox_full.json'),
                )
              ]
              // ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [],
              // ),

              // ),
              ),
        ),

        // ]
      ),
      // ),
    );
  }

//   управление состоянием экранов, смена виджетов с использованием одного Scaffold!!!!!!!!!
}
