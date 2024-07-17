import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherstatename;

  WeatherModel({
    required this.date,
    required this.maxtemp,
    required this.mintemp,
    required this.temp,
    required this.weatherstatename,
  });

  factory WeatherModel.Fromjson(Map<String, dynamic> data) {
    var jsondate = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        maxtemp: jsondate['maxtemp_c'],
        mintemp: jsondate['mintemp_c'],
        temp: jsondate['avgtemp_c'],
        weatherstatename: jsondate['condition']['text']);
  }

  String getImage() {
    if (weatherstatename == 'Sunny' ||
        weatherstatename == 'Clear' ||
        weatherstatename == 'partly cloudy') {
      return 'lib/assats/clear.png';
    } else if (weatherstatename == 'Blizzard' ||
        weatherstatename == 'Patchy snow possible' ||
        weatherstatename == 'Patchy sleet possible' ||
        weatherstatename == 'Patchy freezing drizzle possible' ||
        weatherstatename == 'Blowing snow') {
      return 'lib/assats/snow.png';
    } else if (weatherstatename == 'Freezing fog' ||
        weatherstatename == 'Fog' ||
        weatherstatename == 'Heavy Cloud' ||
        weatherstatename == 'Mist' ||
        weatherstatename == 'Fog') {
      return 'lib/assats/cloudy.png';
    } else if (weatherstatename == 'Patchy rain possible' ||
        weatherstatename == 'Heavy rain' ||
        weatherstatename == 'Moderate rain') {
      return 'lib/assats/rainy.png';
    } else if (weatherstatename == 'Thundery outbreaks possible' ||
        weatherstatename == 'Moderate or heavy snow with thunder' ||
        weatherstatename == 'Patchy light snow with thunder' ||
        weatherstatename == 'Moderate or heavy rain with thunder' ||
        weatherstatename == 'Patchy light rain with thunder') {
      return 'lib/assats/thunderstorm.png';
    } else {
      return 'lib/assats/clear.png';
    }
  }
  MaterialColor getColor() {
    if (weatherstatename == 'Sunny' ||
        weatherstatename == 'Clear' ||
        weatherstatename == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherstatename == 'Blizzard' ||
        weatherstatename == 'Patchy snow possible' ||
        weatherstatename == 'Patchy sleet possible' ||
        weatherstatename == 'Patchy freezing drizzle possible' ||
        weatherstatename == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherstatename == 'Freezing fog' ||
        weatherstatename == 'Fog' ||
        weatherstatename == 'Heavy Cloud' ||
        weatherstatename == 'Mist' ||
        weatherstatename == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherstatename == 'Patchy rain possible' ||
        weatherstatename == 'Heavy rain' ||
        weatherstatename == 'Moderate rain') {
      return Colors.blue;
    } else if (weatherstatename == 'Thundery outbreaks possible' ||
        weatherstatename == 'Moderate or heavy snow with thunder' ||
        weatherstatename == 'Patchy light snow with thunder' ||
        weatherstatename == 'Moderate or heavy rain with thunder' ||
        weatherstatename == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }

}
