import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/logic/weather_bloc.dart';
import 'package:weather/data/repository/repository.dart';
import 'screen/weather_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(),
      child: BlocProvider(
        create: (context) => WeatherBloc(
          RepositoryProvider.of<WeatherRepository>(context),
        )..add(WeatherRequest(city: 'Addis Ababa')),
        child: MaterialApp(
          title: 'Weather BLOC',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: WeatherApp(),
        ),
        // child: Container(child: Text('Works')),
      ),
    );
  }
}
