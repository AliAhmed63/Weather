import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wetherapp/Provider/Weather_Provider.dart';
import 'package:wetherapp/Screen/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:wetherapp/cubits/wether_cubit/weather_cubit.dart';
import 'package:wetherapp/models/Wether_model.dart';
import 'package:wetherapp/services/weather_servic.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
    child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: BlocProvider.of<WeatherCubit>(context).weather==null? Colors.blue :BlocProvider.of<WeatherCubit>(context).weather!.getColor(),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
  }
}
