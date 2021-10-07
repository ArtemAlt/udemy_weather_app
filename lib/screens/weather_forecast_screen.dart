import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:udemy_weather_app/api/weather_api.dart';
import 'package:udemy_weather_app/models/forecast_manual.dart';
import 'package:udemy_weather_app/screens/city_screen.dart';
import 'package:udemy_weather_app/widgets/city_view.dart';
import 'package:udemy_weather_app/widgets/details_view.dart';
import 'package:udemy_weather_app/widgets/temperature_view.dart';
import 'package:udemy_weather_app/widgets/week_waether_view.dart';
import 'dart:developer';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key, required this.weatherInfo}) : super(key: key);
  final WeatherForecast  weatherInfo;

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecast;
  late var cityName;

  @override
  void initState() {
    log("init state -  $widget.weatherInfo.city.name");
    if (widget.weatherInfo != null){
      forecast= Future.value(widget.weatherInfo);
      cityName=widget.weatherInfo.city.name;
    } else {
      forecast = WeatherApi().fetchWeather(cityName,true);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.location_city), onPressed: () async{
              var tappedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                return const CityScreenWidget();
              }));
              if (tappedName!=null){
                setState(() {
                  cityName=tappedName;
                  forecast = WeatherApi().fetchWeather(cityName,true);
                });
              }
          },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.my_location), onPressed: () {
          setState(() {
            forecast = WeatherApi().fetchWeather();
          });
        },
        ),
        backgroundColor: Colors.indigo,
        title: const Text(
          "Weather",
          style: TextStyle(color: Colors.lime,fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          FutureBuilder<WeatherForecast>(
            future: forecast,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return  Column(
                  children: [
                    CityView(forecast: snapshot),
                    const SizedBox(height: 40,),
                    TempView(forecast: snapshot),
                    const SizedBox(height: 40,),
                    DetailsViewWidget(forecast:snapshot),
                    const SizedBox(height: 40,),
                    WeekWeatherViewWidget(forecast:snapshot)
                  ],
                );
              } else {
                return const Center(
                  child: SpinKitWave(
                    color: Colors.indigo,
                    size: 50,
                  ),
                );
              }
            },
          ),

        ],
      ),
    );
  }
}
