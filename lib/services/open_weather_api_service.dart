import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather/enums/weather_units.dart';
import 'package:open_weather/models/weather_data.dart';
import 'package:open_weather/utils/constants.dart';

class OpenWeather {
  OpenWeather({@required this.apiKey});

  @required
  String apiKey;

  Future<WeatherData> currentWeatherByCityName(
      {@required String cityName,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> _currentWeather = await _sendRequest('weather',
          cityName: cityName, weatherUnits: weatherUnits);

      return WeatherData.fromJson(_currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  Future<WeatherData> currentWeatherByLocation(
      {@required double latitude,
      @required double longitude,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> _currentWeather = await _sendRequest('weather',
          lat: latitude, lon: longitude, weatherUnits: weatherUnits);

      return WeatherData.fromJson(_currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _sendRequest(
    final String tag, {
    final double lat,
    final double lon,
    final String cityName,
    final WeatherUnits weatherUnits,
  }) async {
    String url = _buildUrl(tag, cityName, lat, lon, weatherUnits);

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      return jsonBody;
    } else {
      throw Exception("Open Weather API exception - ${response.body}");
    }
  }

  String _buildUrl(
    final String tag,
    final String cityName,
    final double lat,
    final double lon,
    final WeatherUnits weatherUnits,
  ) {
    String url = AppStrings.API_BASE_URL +
        '$tag?units=${weatherUnitsString[weatherUnits]}';

    if (cityName != null) {
      url += '&q=$cityName&';
    } else {
      url += '&lat=$lat&lon=$lon&';
    }

    url += 'appid=$apiKey&';
    return url;
  }
}
