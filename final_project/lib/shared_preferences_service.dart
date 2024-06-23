// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPreferencesService {
//
//   final SharedPreferences sharedPreferences;
//   SharedPreferencesService(this.sharedPreferences);
//
//   Future<void> addTodo(String value) async{
//     final result = sharedPreferences.getStringList('items');
//     print('1');
//     result?.add(value);
//     print('2');
//     await sharedPreferences.setStringList('items', result ?? []);
//     print('3');
//   }
//
//   Future<List<String>> getTodo() async {
//     print('4');
//     return sharedPreferences.getStringList('items') ?? [];
//   }
//
// }

import 'package:shared_preferences/shared_preferences.dart';
import 'package:practice6/screens/todo_preview_screen.dart';

class SharedPreferencesService {
  final SharedPreferences sharedPreferences;
  SharedPreferencesService(this.sharedPreferences);


  // Future<void> addTodo(String value, String item) async {
  //   print('1');
  //   await sharedPreferences.setStringList(
  //       item, (sharedPreferences.getStringList(item) ?? []).followedBy([value]).toList());
  //   print('2');
  //
  // }

  // Future<List<String>> getTodo(item) async {
  //   print('4');
  //   return sharedPreferences.getStringList(item) ?? [];
  // }

  // Future<void> saveTodosForButton(String buttonType, List<String> todos) async {
  //   await sharedPreferences.setStringList('todos_$buttonType', todos);
  // }

  Future<void> addTodo(String value, String key) async{
    final result = sharedPreferences.getStringList(key);
    print('1');
    result?.add(value);
    print('2');
    await sharedPreferences.setStringList(key, result ?? []);
    print('3');
  }

     Future<List<String>> getTodo(String key) async {
      print('4');
      return sharedPreferences.getStringList('todos_$key') ?? [];
    }
  //
  // Future<List<String>> getTodosForButton(String buttonType) async {
  //   // final prefs = await SharedPreferences.getInstance();
  //   return sharedPreferences.getStringList('todos_$buttonType') ?? [];
  //   // return prefs.getStringList('todos_$buttonType') ?? [];
  // }
}