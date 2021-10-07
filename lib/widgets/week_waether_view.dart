import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_weather_app/models/forecast_manual.dart';
import 'package:udemy_weather_app/widgets/weather_card.dart';

class WeekWeatherViewWidget extends StatelessWidget {
  const WeekWeatherViewWidget({Key? key, required this.forecast})
      : super(key: key);
  final AsyncSnapshot<WeatherForecast> forecast;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "7-Day weather Forecast".toUpperCase(),
          style: const TextStyle(
              color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 140,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            itemCount: forecast.data!.weatherList.length,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              color: Colors.indigo,
              child: ForecastCardWidget(forecast:forecast,index:index),
              ),
            ),
          ),
      ],
    );
  }
}

