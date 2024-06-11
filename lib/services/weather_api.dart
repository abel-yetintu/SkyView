import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:sky_view/models/error_response.dart';
import 'package:sky_view/utils/app_exception.dart';
import 'package:sky_view/utils/creds.dart';
import 'package:sky_view/models/weather_forecast.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  static const int TIME_OUT_DURATION = 60;

  Future<WeatherForecast?> getWeatherForecastByCityName(String city) async {
    final uri = Uri.parse('${Credentials.baseUrl}?key=${Credentials.apiKey}&q=$city&days=3&api=no&alerts=n0');
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No internet connection.');
    } on TimeoutException {
      throw ApiNotRespondingException(message: 'Request took too long. try again.');
    }
  }

  WeatherForecast _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return WeatherForecast.fromJson(jsonDecode(response.body));
      case 400:
        throw BadRequestException(message: "Bad Request: ${ErrorResponse.fromJson(jsonDecode(response.body)).error.message}");
      case 401:
      case 403:
        throw UnAuthorizedException(message: 'Unauthorized access: ${ErrorResponse.fromJson(jsonDecode(response.body)).error.message}');
      default:
        throw FetchDataException(message: ErrorResponse.fromJson(jsonDecode(response.body)).error.message);
    }
  }
}
