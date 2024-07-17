import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wetherapp/Provider/Weather_Provider.dart';
import 'package:wetherapp/Screen/Search_PAGE.dart';
import 'package:wetherapp/cubits/wether_cubit/weather_cubit.dart';
import 'package:wetherapp/cubits/wether_cubit/wether_state.dart';
import 'package:wetherapp/models/Wether_model.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search_Page();
                }));
              },
              icon: Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is WeatherSuccess) {
            weatherdata = BlocProvider.of<WeatherCubit>(context).weather;
            return Successloding(weatherdata: weatherdata);
          } else if (state is WeatherFailure) {
            return Center(
              child: Text('Somthing Went Wrong, Please Try Again'),
            );
          } else {
            return DefultHomepage();
          }
        },
      ),
    );
  }
}

class DefultHomepage extends StatelessWidget {
  const DefultHomepage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1000,
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 6,
                ),
                Text(
                  'there is no weather now☂ '
                  'Start Searching Now☺☁',
                  style: TextStyle(
                    fontSize: 27,
                  ),
                ),
                Spacer(
                  flex: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Successloding extends StatelessWidget {
  const Successloding({
    Key? key,
    required this.weatherdata,
  }) : super(key: key);

  final WeatherModel? weatherdata;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          weatherdata!.getColor(),
          weatherdata!.getColor()[300]!,
          weatherdata!.getColor()[100]!,
        ], begin: Alignment.topCenter),
      ),
      child: Column(
        children: [
          Spacer(
            flex: 3,
          ),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Updated : ${weatherdata!.date}',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(weatherdata!.getImage())),
              Text(
                '${weatherdata!.temp.toInt()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Max Temp :${weatherdata!.maxtemp.toInt()}',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'Min Temp:${weatherdata!.mintemp.toInt()}',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text(
                weatherdata!.weatherstatename,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Spacer(flex: 5),
        ],
      ),
    );
  }
}
