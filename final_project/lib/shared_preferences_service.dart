import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences sharedPreferences;

  SharedPreferencesService(this.sharedPreferences);

  Future<List<String>> getTodo([String key = 'goals']) async {
    print('4');
    return sharedPreferences.getStringList('todos_$key') ?? [];
  }
}
