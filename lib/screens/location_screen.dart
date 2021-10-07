import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:udemy_weather_app/api/weather_api.dart';
import 'package:udemy_weather_app/models/forecast_manual.dart';
import 'package:udemy_weather_app/screens/weather_forecast_screen.dart';

class LocationScreenWidget extends StatefulWidget {
  const LocationScreenWidget({Key? key}) : super(key: key);

  @override
  _LocationScreenWidgetState createState() => _LocationScreenWidgetState();
}

class _LocationScreenWidgetState extends State<LocationScreenWidget> {
  void getLocationWeather() async {
     WeatherForecast weatherInfo = await WeatherApi().fetchWeather();
    if (weatherInfo == null) {
      print("Error - " + weatherInfo.toString());
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastScreen(weatherInfo: weatherInfo);
    }));
  }
  @override
  void initState() {
    getLocationWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.indigo,
          size: 50,
        ),
      ),
    );
  }
}
