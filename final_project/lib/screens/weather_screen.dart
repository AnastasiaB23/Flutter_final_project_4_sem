import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice6/model/weather_model.dart';
import 'package:practice6/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('3a5b2d99deca0f83603e63a698e31f27');
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/loading.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'assets/windy.json';
      case 'mist':
        return 'assets/mist.json';
      case 'smoke':
        return 'assets/mist.json';
      case 'snow':
        return 'assets/snow.json';
      case 'haze':
        return 'assets/mist.json';
      case 'dust':
        return 'assets/windy.json';
      case 'fog':
        return 'assets/mist.json';
      case 'rain':
        return 'assets/rainy.json';
      case 'drizzle':
        return 'assets/rainy.json';
      case 'shower rain':
        return 'assets/rainy.json';
      case 'thunderstorm':
        return 'assets/storm.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(),
            child: Text(
              _weather?.cityName ?? "loading city..",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
                Text(
                  '${_weather?.temperature.round()}°C',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  _weather?.mainCondition ?? "",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
