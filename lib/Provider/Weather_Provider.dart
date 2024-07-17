import 'package:flutter/material.dart';
import '../models/Wether_model.dart';

class Weather_provider extends ChangeNotifier {

  WeatherModel? _weatherdate;
  String? cityname;
  set weatherdate(WeatherModel? weather){
    _weatherdate = weather;
    notifyListeners();
  }
  WeatherModel? get weatherdate => _weatherdate;
}
