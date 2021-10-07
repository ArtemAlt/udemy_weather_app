import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy_weather_app/models/forecast_manual.dart';
import 'package:udemy_weather_app/utilities/util.dart';

class DetailsViewWidget extends StatelessWidget {
  const DetailsViewWidget({Key? key, required this.forecast}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> forecast;

  @override
  Widget build(BuildContext context) {
    var forecastList = forecast.data!.weatherList;
    var pressure=forecastList[0].pressure*0.750062;
    int humidity=forecastList[0].humidity;
    var windSpeed = forecastList[0].speed;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,pressure.round(),"mm Hg"),
        Util.getItem(FontAwesomeIcons.cloudRain, humidity, "%"),
        Util.getItem(FontAwesomeIcons.wind, windSpeed.toInt(), "m/s")
      ],
    );
  }
}
