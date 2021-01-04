import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:open_weather/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather/models/weather_data.dart';
import 'package:open_weather/utils/constants.dart';

class OpenWeather {
  String apiKey;

  OpenWeather({@required this.apiKey});

  Future<WeatherData> currentWeatherByCityName(
      {@required String cityName}) async {
    try {
      Map<String, dynamic> _currentWeather =
          await _sendRequest('weather', cityName: cityName);

      return WeatherData.fromJson(_currentWeather);
    } catch (err) {
      print(err);
    }
    return null;
  }

  Future<Map<String, dynamic>> _sendRequest(String tag,
      {double lat, double lon, String cityName}) async {
    String url = _buildUrl(tag, cityName, lat, lon);

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      return jsonBody;
    } else {
      throw Exception("The API threw an exception: ${response.body}");
    }
  }

  String _buildUrl(String tag, String cityName, double lat, double lon) {
    String url = AppStrings.API_BASE_URL + '$tag?';

    if (cityName != null) {
      url += 'q=$cityName&';
    } else {
      url += 'lat=$lat&lon=$lon&';
    }

    url += 'appid=$apiKey&';

    return url;
  }
}
