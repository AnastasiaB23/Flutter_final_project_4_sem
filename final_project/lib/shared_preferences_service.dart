import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences sharedPreferences;

  SharedPreferencesService(this.sharedPreferences);

  // Future<void> addTodo(String value, String key) async {
  //   final result = sharedPreferences.getStringList(key);
  //   print('1');
  //   result?.add(value);
  //   print('2');
  //   await sharedPreferences.setStringList(key, result ?? []);
  //   print('3');
  // }
  Future<void> _saveItems(String key, List<String> values) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, values);
  }

  Future<List<String>> getTodo(String key) async {
    print('4');
    return sharedPreferences.getStringList('todos_$key') ?? [];
  }
  // Future<void> removeTodo(int index, String key) async{
  //   final result = sharedPreferences.getStringList(key);
  //   result?.removeAt(index);
  //   await sharedPreferences.setStringList(key, result?? []);
  // }



  Future<void> removeTodo(int index, String key) async{
      final result = sharedPreferences.getStringList(key);
      result?.removeAt(index);
      await sharedPreferences.setStringList(key, result?? []);
    }
}
