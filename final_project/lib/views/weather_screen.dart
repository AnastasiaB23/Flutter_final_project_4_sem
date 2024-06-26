import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice6/views/train_choice_screen.dart';
import 'package:practice6/models/weather_model.dart';
import 'package:practice6/controllers/weather_service.dart';

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
      body: ListView(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(
              Icons.location_on,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.shortestSide / 7,
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
            SizedBox(
              height: MediaQuery.of(context).size.longestSide / 13,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrainChoiceScreen()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.shortestSide / 1.3,
                  height: MediaQuery.of(context).size.longestSide / 6,
                  padding: EdgeInsets.only(left: 2, right: 2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo, width: 3.5),
                      color: Colors.lightBlue.shade100,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      'Перейти к тренировкам',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.longestSide / 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.9),
                      ),
                    ),
                  ),
                )),
          ]),
        ],
      ),
    );
  }
}
