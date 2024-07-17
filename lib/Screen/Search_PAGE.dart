import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wetherapp/Provider/Weather_Provider.dart';
import 'package:wetherapp/cubits/wether_cubit/weather_cubit.dart';
import 'package:wetherapp/models/Wether_model.dart';
import 'package:wetherapp/services/weather_servic.dart';

class Search_Page extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 150),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName!;
              Navigator.pop(context);
            },
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 28),
              hintText: 'Enter a Sity',
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService();

                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);

                    BlocProvider.of<WeatherCubit>(context, listen: false)
                        .weather = weather;
                    BlocProvider.of<WeatherCubit>(context, listen: false)
                        .cityName = cityName;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              label: Text('Search'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
