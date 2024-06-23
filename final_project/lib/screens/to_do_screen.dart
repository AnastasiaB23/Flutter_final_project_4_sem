import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:practice6/screens/add_todo_screen.dart';
import 'package:practice6/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'todo_preview_screen.dart';
import '';

class ToDoScreen extends StatefulWidget {
  // ButtonType? buttonType;
  String buttonName;

  ToDoScreen({Key? key, required this.buttonName}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

// List<String> getCurrentButtonType(String but_name) {
//   switch (but_name) {
//     case 'button1':
//       return todos_button1;
//     case 'button2':
//       return todos_button2;
//     case 'button3':
//       return todos_button3;
//     case 'button4':
//       return todos_button4;
//     default:
//       return exception;
//   }
//
// }



class _ToDoScreenState extends State<ToDoScreen> {
  // String buttype = widget.buttonType.toString();
  final _todoController = TextEditingController();
  String buttype = '';

  late SharedPreferencesService service;

  // final keys = ['todos_button1', 'todos_button2', 'todos_button3', 'todos_button4'];

  List<String> todos_button1 = ['1']; // Список для хранения полученных данных
  List<String> todos_button2 = ['2'];
  List<String> todos_button3 = ['3'];
  List<String> todos_button4 = ['4'];
  List<String> exception = ['empty here('];

  @override
  void initState() {
    super.initState();
    // ButtonType currBut = widget.buttonType;
    buttype = widget.buttonName;
    _initSharedPreferences();
    // _loadTodosForButton(ButtonType[0]);
    // _loadTodosForButton(ButtonType[1]);
    // _loadTodosForButton(ButtonType[2]);
    // _loadTodosForButton(ButtonType[3]);
    // _loadTodos(); // Загрузите данные при инициализации виджета
  }

  // String buttype = '';
  // String currentBut = '';
  // ButtonType currentButType
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
    // setState(() {
    //
    // });
  }

  // Future<void> _loadTodos() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     todos = prefs.getStringList(buttonName) ?? []; // Обновите список
  //   });
  // }

  // SharedPreferencesService? service;

  // @override
  // void initState() {
  //   super.initState();
  //   initSharedPreferences();
  // }

  Future <void> _initSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      service = SharedPreferencesService(sharedPreferences);
      print('initSharedPrefs1');
    });
      _loadTodosForButton('button1');
      _loadTodosForButton('button2');
      print('initSharedPrefsCallLoad');
      _loadTodosForButton('button3');
      _loadTodosForButton('button4');
  }

  // Future<void> _saveTodosForButton(String buttonType, List<String> todos) async {
  //   await service.saveTodosForButton(buttonType, todos);
  // }

  @override
  Widget build(BuildContext context) {
    List<String> currentTodos = [];
    switch (buttype) {
      case 'button1':
        currentTodos = todos_button1;
        print('got current todos');
      case 'button2':
        currentTodos = todos_button2;

      case 'button3':
        currentTodos = todos_button3;

      case 'button4':
        currentTodos = todos_button4;

      default:
        currentTodos = [];
        print('i am here(');

    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.indigo,
                size: 20,
              ),
            ),
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.search,
                maxLines: 1,
                controller: _todoController,
                keyboardType: TextInputType.text,
                textAlignVertical: TextAlignVertical.center,
                // onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Поиск',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  contentPadding: EdgeInsets.only(left: 0, bottom: 2),
                  focusedBorder: InputBorder.none,
                  filled: true,
                  isDense: true,
                  fillColor: Colors.transparent,
                ),
                style: const TextStyle(
                  fontSize: 14,
                ),
                obscureText: false,
              ),
            )
          ]),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child:
            // FutureBuilder<List<String>>(
            //   future: service!.getTodo(),
            //   builder: (context, snapshot,
            //   )          {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return const Center(child: CircularProgressIndicator());
            // }
            // else if (snapshot.hasError) {
            //   return Text('Error: ${snapshot.error}');
            // } else if (snapshot.hasData) {
            //   return
            ListView.builder(
                itemCount: currentTodos.length,
                // snapshot.hasData ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  return Container(
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
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.check_box_outlined,
                              color: Colors.indigo,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(currentTodos[index],
                                  // snapshot.data![index],
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                        // setState(() {
                        // switch (buttype) {
                        // case 'button1':
                        // todos_button1.removeAt(index);
                        // _saveTodosForButton('button1', todos_button1);
                        // break;
                        //   case 'button2':
                        //     todos_button2.removeAt(index);
                        //     _saveTodosForButton('button2', todos_button2);
                        //     break;
                        //   case 'button3':
                        //     todos_button3.removeAt(index);
                        //     _saveTodosForButton('button3', todos_button3);
                        //     break;
                        //   case 'button4':
                        //     todos_button4.removeAt(index);
                        //     _saveTodosForButton('button4', todos_button4);
                        //     break;
                        //   default:
                        //     break;
                        // }
                        // });
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ]),
                  );
                }),
        // }
        // else {
        //   return const Center(child: CircularProgressIndicator());
        // }
        // }
      ),

      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => AddTodoScreen(buttonName: buttype),
          ),
          // ).
          // then((result) {
          //   if (result != null) {
          //     // Получите новую задачу из result
          //     setState(() {
          //       switch (buttype) {
          //         case 'button1':
          //           todos_button1.add(result);
          //           _saveTodosForButton('button1', todos_button1);
          //           break;
          //         case 'button2':
          //           todos_button2.add(result);
          //           _saveTodosForButton('button2', todos_button2);
          //           break;
          //         case 'button3':
          //           todos_button3.add(result);
          //           _saveTodosForButton('button3', todos_button3);
          //           break;
          //         case 'button4':
          //           todos_button4.add(result);
          //           _saveTodosForButton('button4', todos_button4);
          //           break;
          //         default:
          //           break;
          //       }
          //     });
          //   }

          // }
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
