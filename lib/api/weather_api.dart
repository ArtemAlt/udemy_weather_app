import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:udemy_weather_app/models/forecast_manual.dart';
import 'package:udemy_weather_app/utilities/constants.dart';
import 'package:udemy_weather_app/utilities/location.dart';

class WeatherApi {

  Future<WeatherForecast> fetchWeather( [String? cityName,bool? isCity]) async {

    Map<String, String>? parameters;
    if (isCity == true){
       var queryParameters = {
        "appid": Constants.WEATHER_KEY,
        "cnt": "7",
        "q": cityName,
        "units": "metric"
      };

      parameters=queryParameters.cast<String, String>();
       log("Start fetching weather. parameters: $parameters");
    } else{
      Location location = Location();
      await location.getCurrentLocation();
       var queryParameters = {
        "appid": Constants.WEATHER_KEY,
        "cnt": "7",
        "lat": location.latitude.toString(),
        "lon": location.longitude.toString(),
         "units": "metric"
      };
      parameters=queryParameters.cast<String, String>();
      log("Start fetching weather. parameters: $parameters");
    }
    var uri = Uri.https(
        Constants.WEATHER_BASE_URL, Constants.WEATHER_BASE_REQUEST,
        parameters);
    log("request fot url - " + uri.toString());
    var response = await http.get(uri);
    log("response : "+response.statusCode.toString());
    if (response.statusCode==200){
      return WeatherForecast.fromJSON(jsonDecode(response.body));
    }
    else{
      throw Exception("Error response");
    }
  }

  }
