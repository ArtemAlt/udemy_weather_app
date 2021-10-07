import 'dart:core';

import 'package:udemy_weather_app/utilities/constants.dart';

class WeatherForecast {
  late City city;
  late String cod;
  late double message;
  late int cnt;
  late List<WeatherList> weatherList;

  WeatherForecast(
      this.city, this.cod, this.message, this.cnt, this.weatherList);

  WeatherForecast.fromJSON(Map<String, dynamic> json){
    city=City.fromJSON(json['city']);
    cod=json['cod'] as String;
    message=json['message'].toDouble();
    cnt=json['cnt'] as int;
    weatherList=(json['list'] as List).map((e) => WeatherList.fromJSON(e)).toList();
  }


  Map<String, dynamic> toJSON()=>{
    'city':city.toJSON(),
    'cod':cod,
    'message':message,
    'cnt':cnt,
    'list':weatherList.map((e) => e.toJson()).toList()
  };
}

class WeatherList {
  late int dt;
  late int sunrise;
  late int sunset;
  late Temp temp;
  late FeelsLike feelsLike;
  late int pressure;
  late int humidity;
  late List<Weather> weather;
  late double speed;
  late int deg;
  late double gust;
  late int clouds;
  late num pop;

  WeatherList(
      this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.weather,
      this.speed,
      this.deg,
      this.gust,
      this.clouds,
      this.pop);

  WeatherList.fromJSON(Map<String, dynamic> json) {
    dt = json['dt'] as int;
    sunrise = json['sunrise'] as int;
    sunset = json['sunset'] as int;
    temp = Temp.fromJson(json['temp']!);
    feelsLike = FeelsLike.fromJSON(json['feels_like']!);
    pressure = json['pressure'] as int;
    humidity = json['humidity'] as int;
    weather =
        (json['weather'] as List).map((e) => Weather.fromJson(e)).toList();
    speed = json['speed'].toDouble();
    deg = json['deg'] as int;
    gust = json['gust'].toDouble();
    clouds = json['clouds'] as int;
    pop= json['pop'] ;
  }

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'sunrise': sunrise,
        'sunset': sunset,
        'temp': temp.toJson(),
        'feels_like': feelsLike.toJson(),
        'pressure': pressure,
        'humidity': humidity,
        'weather': weather.map((e) => e.toJson()).toList(),
        'speed': speed,
        'deg': deg,
        'gust': gust,
        'clouds': clouds,
        'pop': pop
      };

  String getIconUrl() {
    return Constants.WEATHER_IMAGES_URL+weather[0].icon+".png";
  }
}

class Weather {
  late int id;
  late String main;
  late String description;
  late String icon;

  Weather(this.id, this.main, this.description, this.icon);

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class FeelsLike {
  late double day;
  late double night;
  late double eve;
  late double morn;

  FeelsLike(this.day, this.night, this.eve, this.morn);

  FeelsLike.fromJSON(Map<String, dynamic> json) {
    day = json['day'].toDouble();
    night = json['night'].toDouble();
    eve = json['eve'].toDouble();
    morn = json['morn'].toDouble();
  }

  Map<String, dynamic> toJson() =>
      {'day': day, 'night': night, 'eve': eve, 'morn': morn};
}

class Temp {
  late double day;
  late double min;
  late double max;
  late double night;
  late double eve;
  late double morn;

  Temp(this.day, this.min, this.max, this.night, this.eve, this.morn);

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'].toDouble();
    min = json['min'].toDouble();
    max = json['max'].toDouble();
    night = json['night'].toDouble();
    eve = json['eve'].toDouble();
    morn = json['morn'].toDouble();
  }

  Map<String, dynamic> toJson() => {
        'day': day,
        'min': min,
        'max': max,
        'night': night,
        'eve': eve,
        'morn': morn
      };
}

class City {
  late int id;
  late String name;
  late Coord coord;
  late String country;
  late int population;
  late int timeZone;

  City(this.id, this.name, this.coord, this.country, this.population,
      this.timeZone);

  Map<String, dynamic> toJSON() => {
        'id': id,
        'name': name,
        'coord': coord.toJSON(),
        'country': country,
        'population': population,
        'timezone': timeZone
      };

  City.fromJSON(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    coord = Coord.fromJSON(json['coord']);
    country=json['country'];
    population=json['population'];
    timeZone=json['timezone'];
  }
}

class Coord {
  late double lon;
  late double lat;

  Coord(this.lon, this.lat);

  Map<String, dynamic> toJSON() => {'lon': lon, 'lat': lat};

  Coord.fromJSON(Map<String, dynamic> json) {
    lon = json['lon'].toDouble();
    lat = json['lat'].toDouble();
  }
}
