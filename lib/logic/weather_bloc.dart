import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/data/repository/repository.dart';
import 'package:weather/data/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // final repository = WeatherRepository();
  final WeatherRepository repository;

  WeatherBloc(this.repository) : super(WeatherInitial()) {
    on<WeatherRequest>((event, emit) async {
      // print('Called Here 0');
      emit(WeatherLoadInProgress());
      final weatherResponse = await repository.getWeather(event.city);
      emit(WeatherLoadingSuccess(weather: weatherResponse));
    });
  }
}
