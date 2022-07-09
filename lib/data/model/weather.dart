class Weather {
  final double temp;
  final String city;
  Weather({required this.temp, required this.city});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(temp: json['main']['temp'], city: json['name']);
  }
}
