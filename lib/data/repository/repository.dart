import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/data/provider/data_provider.dart';
import 'package:weather/data/model/weather.dart';

class WeatherRepository {
  late final DataProvider _provider = DataProvider();

  Future<Weather> getWeather(String city) async {
    final http.Response rawWeather = await _provider.getRawData(city);
    final json = jsonDecode(rawWeather.body);

    final Weather weather = Weather.fromJson(json);

    return weather;
  }
}
