import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather_client/enums/weather_units.dart';
import 'package:open_weather_client/models/weather_data.dart';
import 'package:open_weather_client/models/weather_forecast_data.dart';
import 'package:open_weather_client/utils/constants.dart';

class OpenWeather {
  OpenWeather({@required this.apiKey});

  /// [apiKey] is used to authenticate the user with OpenWeather API.
  /// without proper API key, the other functions throws Exception.
  final String apiKey;

  Future<WeatherData> currentWeatherByCityName(

      /// Retrieves the WeatherData object by the current city name
      /// In order to use the function, [cityName] is required
      /// It is possible to set the weather units by setting a specific value in [weatherUnits]
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

      /// Retrieves the WeatherData object by the current location
      /// In order to use the function, [latitude] and [longitude] is required
      /// It is possible to set the weather units by setting a specific value in [weatherUnits]
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

  Future<WeatherData> currentWeatherByZipCode(

      /// Retrieves the WeatherData object by ZipCode and Country code
      /// In order to use the function, [zipCode] and [countryCode] is required
      /// It is possible to set the weather units by setting a specific value in [weatherUnits]
      {@required int zipCode,
      @required String countryCode,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> _currentWeather = await _sendRequest('weather',
          zipCode: zipCode,
          countryCode: countryCode,
          weatherUnits: weatherUnits);

      return WeatherData.fromJson(_currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  Future<WeatherForecastData> fiveDaysWeatherForecastByCityName(

      /// Retrieves the weatherForecastData object by the current city name
      /// In order to use the function, [cityName] is required
      /// It is possible to set the weather units by setting a specific value in [weatherUnits]
      {@required String cityName,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> _currentWeather = await _sendRequest('forecast',
          cityName: cityName, weatherUnits: weatherUnits);

      return WeatherForecastData.fromJson(_currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  Future<WeatherForecastData> fiveDaysWeatherForecastByLocation(

      /// Retrieves the WeatherForecastData object by the current location
      /// In order to use the function, [latitude] and [longitude] is required
      /// It is possible to set the weather units by setting a specific value in [weatherUnits]
      {@required double latitude,
      @required double longitude,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> _currentWeather = await _sendRequest('forecast',
          lat: latitude, lon: longitude, weatherUnits: weatherUnits);

      return WeatherForecastData.fromJson(_currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  Future<WeatherForecastData> fiveDaysWeatherForecastByZipCode(

      /// Retrieves the WeatherData object by ZipCode and Country code
      /// In order to use the function, [zipCode] and [countryCode] is required
      /// It is possible to set the weather units by setting a specific value in [weatherUnits]
      {@required int zipCode,
      @required String countryCode,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> _currentWeather = await _sendRequest('forecast',
          zipCode: zipCode,
          countryCode: countryCode,
          weatherUnits: weatherUnits);

      return WeatherForecastData.fromJson(_currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _sendRequest(
    /// General request handler
    /// [tag] is being used to specify some options in order to make it robust
    /// [lat] is for latitude
    /// [lon] is for longitude
    /// [cityName] is for cityName
    /// [weatherUnits] is for setting the weather unit.
    final String tag, {
    final double lat,
    final double lon,
    final String cityName,
    final int zipCode,
    final String countryCode,
    final WeatherUnits weatherUnits,
  }) async {
    String url =
        _buildUrl(tag, cityName, lat, lon, zipCode, countryCode, weatherUnits);

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      return jsonBody;
    } else {
      throw Exception("Open Weather API exception - ${response.body}");
    }
  }

  String _buildUrl(
    /// Function to set up the request URL with the specified parameters
    /// [tag] is being used to specify some options in order to make it robust
    /// [lat] is for latitude
    /// [lon] is for longitude
    /// [cityName] is for cityName
    /// [weatherUnits] is for setting the weather unit.
    final String tag,
    final String cityName,
    final double lat,
    final double lon,
    final int zipCode,
    final String countryCode,
    final WeatherUnits weatherUnits,
  ) {
    String url = AppStrings.API_BASE_URL +
        '$tag?units=${weatherUnitsString[weatherUnits]}';

    if (cityName != null) {
      url += '&q=$cityName&';
    } else if (lat != null && lon != null) {
      url += '&lat=$lat&lon=$lon&';
    } else if (zipCode != null && countryCode != null) {
      url += '&zip=$zipCode,$countryCode&';
    }

    url += 'appid=$apiKey&';
    return url;
  }
}
