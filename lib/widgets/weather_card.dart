import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_weather_app/models/forecast_manual.dart';
import 'package:udemy_weather_app/utilities/util.dart';

class ForecastCardWidget extends StatelessWidget {
  const ForecastCardWidget(
      {Key? key, required this.forecast, required this.index})
      : super(key: key);
  final AsyncSnapshot<WeatherForecast> forecast;
  final int index;

  @override
  Widget build(BuildContext context) {
    var inputData = forecast.data!.weatherList[index];
    var icon = inputData.getIconUrl();
    var tempMin = inputData.temp.min.round();
    var dayOfWeek = "";
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        inputData.dt * 1000);
    var fullDate = Util.formatRequestDate(date);
    dayOfWeek = fullDate.split(" ")[0];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dayOfWeek,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "$tempMin  °C",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Image.network(icon,scale: 1.2,)
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
