part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingInProgress extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadingSuccess extends WeatherState {
  final Weather weather;
  WeatherLoadingSuccess({required this.weather});
}

class WeatherLoadingFailed extends WeatherState {
  final String message;
  WeatherLoadingFailed({required this.message});
}
