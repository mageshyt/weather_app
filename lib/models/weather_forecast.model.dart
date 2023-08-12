// ignore: camel_case_types
import 'package:weather_app/constans/assets_constants.dart';

enum weatherType {
  sunny,
  cloudy,
  rainy,
  snowy,
  foggy,
  thunderstorm,
  windy,
  unknown
}

class WeatherForecast {
  final int tempetature;
  final DateTime time;
  final weatherType weather;
  WeatherForecast({
    required this.tempetature,
    required this.time,
    required this.weather,
  });

  Map<String, dynamic> toMap() {
    return {
      'tempetature': tempetature,
      'time': time,
      'weather': weather,
      'icon': getWeatherIcon(),
    };
  }

  // get weather icon from weather type

  String getWeatherIcon() {
    switch (weather) {
      case weatherType.sunny:
        return AssetsConstants.sunny;
      case weatherType.cloudy:
        return AssetsConstants.cloudy;
      case weatherType.rainy:
        return AssetsConstants.rainy;
      case weatherType.snowy:
        return AssetsConstants.snow_image;
      case weatherType.thunderstorm:
        return AssetsConstants.thunderStorm;
      case weatherType.windy:
        return AssetsConstants.windy;
      case weatherType.foggy:
        return AssetsConstants.foggy;
      default:
        return 'assets/images/sun/8.png';
    }
  }

  // 6 dummy data

  static List<WeatherForecast> dummyDate = [
    WeatherForecast(
        tempetature: 30, time: DateTime.now(), weather: weatherType.sunny),
    WeatherForecast(
        tempetature: 32, time: DateTime.now(), weather: weatherType.snowy),
    WeatherForecast(
        tempetature: 28, time: DateTime.now(), weather: weatherType.rainy),
    WeatherForecast(
        tempetature: 30,
        time: DateTime.now(),
        weather: weatherType.thunderstorm),
    WeatherForecast(
        tempetature: 30, time: DateTime.now(), weather: weatherType.windy),
    WeatherForecast(
        tempetature: 30, time: DateTime.now(), weather: weatherType.foggy),
  ];

  @override
  String toString() {
    return 'WeatherForecast(tempetature: $tempetature, time: $time, weather: $weather)';
  }
}
