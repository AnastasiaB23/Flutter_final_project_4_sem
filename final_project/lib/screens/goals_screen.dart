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
                  await prefs.setStringList('todos_goals', goals);
                },
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

  Widget Congratulations() {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Stack(children: <Widget>[
            Lottie.asset('assets/congratulations.json'),
            Container(
              padding: EdgeInsets.only(top: 130),
              child: Lottie.asset('assets/checkbox_full.json'),
            )
          ]),
        ),
      ),
    );
  }
}
