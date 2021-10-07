import 'package:flutter/material.dart';
import 'package:udemy_weather_app/models/forecast_manual.dart';
import 'package:udemy_weather_app/utilities/util.dart';

class CityView extends StatelessWidget {
  const CityView({Key? key, required this.forecast}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> forecast;

  @override
  Widget build(BuildContext context) {
    var city = forecast.data!.city.name;
    var country = forecast.data!.city.country;
    var responseDate = DateTime.fromMillisecondsSinceEpoch(forecast.data!.weatherList[0].dt*1000);
    var currentDate = Util.formatRequestDate(responseDate);
    return Column(
      children: [
      const SizedBox(
      height: 20,
    ),
    Text(
      "$city, $country",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.indigo,
      ),
    ), Text(currentDate, style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Colors.indigo, ))
    ],
    );
  }
}
