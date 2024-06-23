import 'package:flutter/material.dart';
import 'package:practice6/screens/add_todo_screen.dart';
import 'package:practice6/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoScreen extends StatefulWidget {

  String buttonName;

  ToDoScreen({Key? key, required this.buttonName}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}


class _ToDoScreenState extends State<ToDoScreen> {
  final _todoController = TextEditingController();
  String buttype = '';

  late SharedPreferencesService service;

  List<String> todos_button1 = ['1']; // Список для хранения полученных данных
  List<String> todos_button2 = ['2'];
  List<String> todos_button3 = ['3'];
  List<String> todos_button4 = ['4'];
  List<String> exception = ['empty here('];

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
  }


  Future <void> _initSharedPreferences() async {
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
        // currentTodos = [];
        print('i am here(');

    }

  }

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
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {

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
      ),

      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => AddTodoScreen(buttonName: buttype),
          ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
