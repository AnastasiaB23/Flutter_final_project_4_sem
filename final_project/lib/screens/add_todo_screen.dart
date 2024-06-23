import 'package:flutter/material.dart';
import 'package:practice6/screens/to_do_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTodoScreen extends StatefulWidget {
  final String buttonName;

  const AddTodoScreen({Key? key, required this.buttonName}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController controller = TextEditingController();
  late String buttonName;

  @override
  void initState() {
    super.initState();
    buttonName = widget.buttonName;
  }

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
                  final prefs = await SharedPreferences.getInstance();
                  String key = 'todos_$buttonName';

                  await prefs.setStringList(
                      key,
                      (prefs.getStringList(key) ?? [])
                          .followedBy([controller.text]).toList());
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ToDoScreen(
                              buttonName: buttonName,
                            )),
                  );
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
