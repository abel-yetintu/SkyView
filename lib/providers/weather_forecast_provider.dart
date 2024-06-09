import 'package:flutter/material.dart';
import 'package:sky_view/models/weather_forecast.dart';
import 'package:sky_view/services/weather_api.dart';
import 'package:sky_view/utils/app_exception.dart';

class WeatherForecastProvider extends ChangeNotifier {
  final WeatherApi _weatherApi = WeatherApi();

  bool isLoading = true;

  WeatherForecast? _weatherForecast;
  WeatherForecast? get weatherForecast => _weatherForecast;

  AppException? _appException;
  AppException? get appException => _appException;

  getWeatherForecastByCityName(String city) async {
    isLoading = true;
    notifyListeners();
    try {
      _weatherForecast = await _weatherApi.getWeatherForecastByCityName(city);
      _appException = null;
    } on AppException catch (e) {
      _appException = e;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
