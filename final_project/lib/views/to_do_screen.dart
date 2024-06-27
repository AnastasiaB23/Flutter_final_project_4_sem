import 'package:flutter/material.dart';
import 'package:practice6/views/add_todo_screen.dart';
import 'package:practice6/controllers/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoScreen extends StatefulWidget {
  final String buttonName;

  ToDoScreen({Key? key, required this.buttonName}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  String buttype = '';
  late List<String> currentTodos;
  late String categoryName;
  late Color backColor;

  late SharedPreferencesService service;

  List<String> todos_button1 = [];
  List<String> todos_button2 = [];
  List<String> todos_button3 = [];
  List<String> todos_button4 = [];

  @override
  void initState() {
    super.initState();
    buttype = widget.buttonName;
    _initSharedPreferences();
  }

  Future<void> _loadTodosForButton(String buttonType) async {
    final todos = await service.getTodo(buttonType);
    switch (buttonType) {
      case 'button1':
        setState(() {
          todos_button1 = todos;
        });
      case 'button2':
        setState(() {
          todos_button2 = todos;
        });
      case 'button3':
        setState(() {
          todos_button3 = todos;
        });
      case 'button4':
        setState(() {
          todos_button4 = todos;
        });
      default:
        return Future.error(buttonType);
    }
    setState(() {});
  }

  Future<void> _initSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      service = SharedPreferencesService(sharedPreferences);
      print('initSharedPrefs1');
    });
    switch (buttype) {
      case 'button1':
        _loadTodosForButton('button1');
        print('loadtodos1');
      case 'button2':
        _loadTodosForButton('button2');
        print('loadtodos2');
      case 'button3':
        _loadTodosForButton('button3');
        print('loadtodos3');
      case 'button4':
        _loadTodosForButton('button4');
        print('loadtodos4');
      default:
        print('i am here(');
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (buttype) {
      case 'button1':
        currentTodos = todos_button1;
        categoryName = '1. Срочное и важное';
        backColor = Colors.deepOrangeAccent;
        print('got current todos');
      case 'button2':
        currentTodos = todos_button2;
        categoryName = '2. Не срочное и важное';
        backColor = Colors.yellow;
      case 'button3':
        currentTodos = todos_button3;
        categoryName = '3. Срочное и не важное';
        backColor = Colors.green;
      case 'button4':
        currentTodos = todos_button4;
        categoryName = '4. Не срочное и не важное';
        backColor = Colors.blueAccent;
      default:
        currentTodos = [];
    }

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(),
            child: Text(
              categoryName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  backgroundColor: backColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: currentTodos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => AddTodoScreen(
                              buttonName: buttype,
                              title: currentTodos[index],
                              index: index)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: Colors.indigo,
                          )),
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      height: 60,
                      child: Row(children: [
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  currentTodos[index],
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              setState(() {
                                currentTodos.removeAt(index);
                                // print('worked');
                              });

                              final prefs =
                                  await SharedPreferences.getInstance();
                              print(currentTodos);
                              await prefs.setStringList(
                                  'todos_$buttype', currentTodos);
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ]),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  AddTodoScreen(buttonName: buttype, title: '', index: 0),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
