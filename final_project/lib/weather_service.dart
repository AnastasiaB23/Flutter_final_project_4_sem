import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../model/weather_model.dart';
import 'package:http/http.dart' as http;
// import 'package:location/location.dart';

class WeatherService{
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;



  WeatherService(this.apiKey);

  Future<Weather> getWeather (String cityName) async {
    final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
    if (response.statusCode==200){
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();

    // Проверка разрешения
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      // Запрос разрешения
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Пользователь отказал в разрешении
        return "Пользователь не предоставил разрешение";
      } else if (permission == LocationPermission.deniedForever) {
        // Пользователь не предоставил разрешение и выбрал "никогда не спрашивать снова"
        return "Пользователь не предоставил разрешение";
      }
    }

    // Получение координат
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Получение местоположения по координатам
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    // Извлечение города из местоположения
    String? city = placemarks[0].locality;

    // Возврат города или пустой строки, если город не найден
    return city ?? "";
  }

  // Future<String> getCurrentCity() async{
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission==LocationPermission){
  //     permission = await Geolocator.requestPermission();
  //   }
  //
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //
  //   List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  //
  //   String? city = placemarks[0].locality;
  //   return city ?? "";
  // }

}