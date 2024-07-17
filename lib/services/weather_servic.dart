import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wetherapp/models/Wether_model.dart';
class WeatherService
{
  String baseurl = 'http://api.weatherapi.com/v1';
  String apiKey = 'e8d0c39aa8f14792ab6165020230106';

  Future<WeatherModel?> getWeather({required String cityName}) async
  {
    WeatherModel? weather;
    try{
      Uri url = Uri.parse('$baseurl/forecast.json?key=$apiKey&q=$cityName&days=7&');
      http.Response response = await http.get(url);

      Map<String , dynamic> data= jsonDecode(response.body);

      WeatherModel weather = WeatherModel.Fromjson(data);
      return weather;

    }
    catch(e){

    }
    return weather;
  }
}