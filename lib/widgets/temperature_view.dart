import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_weather_app/models/forecast_manual.dart';

class TempView extends StatelessWidget {
  const TempView({Key? key, required this.forecast}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> forecast;

  @override
  Widget build(BuildContext context) {
    var weatherIcon = forecast.data!.weatherList[0].getIconUrl();
    String currentTemp =
        forecast.data!.weatherList[0].temp.day.toStringAsFixed(0);
    String description =
        forecast.data!.weatherList[0].weather[0].description.toUpperCase();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          weatherIcon,
          scale: 0.4,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentTemp + " °C",
              style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              description,
              style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
