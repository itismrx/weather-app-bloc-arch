import 'package:http/http.dart' as http;

class DataProvider {
  Future<http.Response> getRawData(String city) async {
    String uri =
        'https://api.openweathermap.org/data/2.5/weather?appid=7fd973481c1bcea27004a5aebbb3766f&q=${city}&units=metric';
    http.Response rawData = await http.get(Uri.parse(uri));

    return rawData;
  }
}
