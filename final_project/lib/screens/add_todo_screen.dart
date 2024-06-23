import 'package:flutter/material.dart';
import 'package:practice6/screens/to_do_screen.dart';
import 'package:practice6/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'todo_preview_screen.dart';

class AddTodoScreen extends StatefulWidget {

  final String buttonName;

  const AddTodoScreen({Key? key, required this.buttonName}) : super(key: key);


  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {


  TextEditingController controller = TextEditingController();
  // late ButtonType _buttonType; // Переменная для хранения имени кнопки
  late String buttonName;


  @override
  void initState() {
    super.initState();
    buttonName = widget.buttonName;

    // ButtonType _buttonType = widget.buttonName;// Получение имени кнопки
  }

  // Future<List<String>> getTodosForButton(String buttonName) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getStringList('todos_$buttonName') ?? [];
  // }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                hintText: 'Создать новое',
                fillColor: Colors.white70,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: ElevatedButton(
              onPressed: () async {
                if (controller.text.isNotEmpty) {
                    // String newTask = controller.text.trim();
                    // // Передайте новую задачу обратно в ToDoScreen
                    // Navigator.pop(context, newTask);



                  // Получаем экземпляр SharedPreferences
                  final prefs = await SharedPreferences.getInstance();


// // Создаем экземпляр SharedPreferencesService
//                      final service = SharedPreferencesService(prefs);
//
//                     await service.addTodo(controller.text, 'todos_$buttonName');

// Добавляем задачу

// Получаем задачи для кнопки
//                   final tasks = await service.getTodosForButton("Главная кнопка");
                  // final prefs = await SharedPreferences.getInstance();

                  // final key = getCurrentButtonType(buttonName).toString();

                  // await service.addTodo(controller.text, key);
                  String key = 'todos_$buttonName';

                  await prefs.setStringList(
                      key, // Используйте полученный ключ
                      (prefs.getStringList(key) ?? []).followedBy([controller.text]).toList()); // Используйте _controller.text
                  // final prefs = await SharedPreferences.getInstance();
                  // await prefs
                  //     .setStringList(
                  //     'todos_$buttonName',
                  //     (prefs.getStringList('todos_$buttonName') ?? []).followedBy([controller.text]).toList());


                  // final sharedPreferences =
                  //     await SharedPreferences.getInstance();
                  print('job is done!');
                  // SharedPreferencesService(sharedPreferences)
                  //     .addTodo(controller.text);
                  // print(prefs.getStringList(buttonName));
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoScreen(buttonName: buttonName,)),);
                  // Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ToDoScreen(buttonName: buttonName,)),);
                }
              },
              child: const Text(
                'Сохранить',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
