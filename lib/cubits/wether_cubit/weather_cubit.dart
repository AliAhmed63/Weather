import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wetherapp/cubits/wether_cubit/wether_state.dart';
import '../../models/Wether_model.dart';
import '../../services/weather_servic.dart';

class WeatherCubit extends Cubit<WeatherState>
{
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService ;
  String? cityName;
  WeatherModel? weather;
  void getWeather({required String cityName})
  async{
    emit(WeatherLoading());
   try {
    weather = await weatherService.getWeather(cityName: cityName);
     emit(WeatherSuccess());
   } on Exception catch (e) {
     emit(WeatherFailure());
   }
  }
}