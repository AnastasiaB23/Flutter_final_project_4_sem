import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences sharedPreferences;

  SharedPreferencesService(this.sharedPreferences);

  Future<void> addTodo(String value, String key) async {
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
}
