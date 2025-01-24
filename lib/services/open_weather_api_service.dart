import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_weather_client/enums/languages.dart';
import 'package:open_weather_client/enums/weather_units.dart';
import 'package:open_weather_client/models/weather_data.dart';
import 'package:open_weather_client/models/weather_forecast_data.dart';

/// The base URL for the OpenWeatherMap API.
///
/// This constant holds the base URL for accessing the OpenWeatherMap API
/// endpoints. It is used to construct the full URL for API requests.
///
/// Example usage:
/// ```dart
/// final url = '$kApiBaseURL/weather?q=London&appid=YOUR_API_KEY';
/// ```
///
const kApiBaseURL = 'https://api.openweathermap.org/data/2.5/';

/// A service class for interacting with the OpenWeather API.
///
/// This class provides methods to fetch weather data from the OpenWeather API
/// using the provided API key.
///
/// Example usage:
/// ```dart
/// final openWeather = OpenWeather(apiKey: 'your_api_key');
/// ```
///
/// The [apiKey] parameter is required to authenticate requests to the OpenWeather API.
class OpenWeather {
  /// Constructor for the OpenWeather class.
  ///
  /// Takes an [apiKey] as a required parameter to authenticate API requests.
  OpenWeather({required this.apiKey});

  /// [apiKey] is used to authenticate the user with OpenWeather API.
  /// without proper API key, the other functions throws Exception.
  final String apiKey;

  /// Retrieves the WeatherData object by the current city name
  /// In order to use the function, [cityName] is required
  /// It is possible to set the weather units by setting a specific value in [weatherUnits]
  Future<WeatherData> currentWeatherByCityName(
      {required String cityName,
      final Languages? language,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> currentWeather = await _sendRequest('weather',
          cityName: cityName, weatherUnits: weatherUnits, language: language);
      return WeatherData.fromJson(currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  /// Retrieves the WeatherData object by the current location
  /// In order to use the function, [latitude] and [longitude] is required
  /// It is possible to set the weather units by setting a specific value in [weatherUnits]
  Future<WeatherData> currentWeatherByLocation(
      {required double latitude,
      required double longitude,
      final Languages? language,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> currentWeather = await _sendRequest('weather',
          lat: latitude,
          lon: longitude,
          weatherUnits: weatherUnits,
          language: language);
      return WeatherData.fromJson(currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  /// Retrieves the WeatherData object by ZipCode and Country code
  /// In order to use the function, [zipCode] and [countryCode] is required
  /// It is possible to set the weather units by setting a specific value in [weatherUnits]
  Future<WeatherData> currentWeatherByZipCode(
      {required int zipCode,
      required String countryCode,
      final Languages? language,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> currentWeather = await _sendRequest('weather',
          zipCode: zipCode,
          countryCode: countryCode,
          weatherUnits: weatherUnits,
          language: language);
      return WeatherData.fromJson(currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  /// Retrieves the weatherForecastData object by the current city name
  /// In order to use the function, [cityName] is required
  /// It is possible to set the weather units by setting a specific value in [weatherUnits]
  Future<WeatherForecastData> fiveDaysWeatherForecastByCityName(
      {required String cityName,
      final Languages? language,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> currentWeather = await _sendRequest('forecast',
          cityName: cityName, weatherUnits: weatherUnits, language: language);

      return WeatherForecastData.fromJson(currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  /// Retrieves the WeatherForecastData object by the current location
  /// In order to use the function, [latitude] and [longitude] is required
  /// It is possible to set the weather units by setting a specific value in [weatherUnits]
  Future<WeatherForecastData> fiveDaysWeatherForecastByLocation(
      {required double latitude,
      required double longitude,
      final Languages? language,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> currentWeather = await _sendRequest('forecast',
          lat: latitude,
          lon: longitude,
          weatherUnits: weatherUnits,
          language: language);

      return WeatherForecastData.fromJson(currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  /// Retrieves the WeatherData object by ZipCode and Country code
  /// In order to use the function, [zipCode] and [countryCode] is required
  /// It is possible to set the weather units by setting a specific value in [weatherUnits]
  Future<WeatherForecastData> fiveDaysWeatherForecastByZipCode(
      {required int zipCode,
      required String countryCode,
      final Languages? language,
      WeatherUnits weatherUnits = WeatherUnits.IMPERIAL}) async {
    try {
      Map<String, dynamic> currentWeather = await _sendRequest('forecast',
          zipCode: zipCode,
          countryCode: countryCode,
          weatherUnits: weatherUnits,
          language: language);

      return WeatherForecastData.fromJson(currentWeather);
    } catch (err) {
      rethrow;
    }
  }

  /// General request handler
  /// [tag] is being used to specify some options in order to make it robust
  /// [lat] is for latitude
  /// [lon] is for longitude
  /// [cityName] is for cityName
  /// [weatherUnits] is for setting the weather unit.
  Future<Map<String, dynamic>> _sendRequest(
    final String tag, {
    final double? lat,
    final double? lon,
    final String? cityName,
    final int? zipCode,
    final String? countryCode,
    final WeatherUnits? weatherUnits,
    final Languages? language,
  }) async {
    String url = _buildUrl(
        tag: tag,
        cityName: cityName,
        lat: lat,
        lon: lon,
        zipCode: zipCode,
        countryCode: countryCode,
        weatherUnits: weatherUnits ?? WeatherUnits.STANDARD,
        language: language ?? Languages.ENGLISH);

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      return jsonBody;
    } else {
      throw Exception("Open Weather API exception - ${response.body}");
    }
  }

  /// Function to set up the request URL with the specified parameters
  /// [tag] is being used to specify some options in order to make it robust
  /// [lat] is for latitude
  /// [lon] is for longitude
  /// [cityName] is for cityName
  /// [weatherUnits] is for setting the weather unit.
  String _buildUrl({
    required final String tag,
    final String? cityName,
    final double? lat,
    final double? lon,
    final int? zipCode,
    final String? countryCode,
    final Languages? language,
    required final WeatherUnits weatherUnits,
  }) {
    String url = '$kApiBaseURL$tag?units=${weatherUnitsString[weatherUnits]}';

    if (cityName != null) {
      url += '&q=$cityName&';
    } else if (lat != null && lon != null) {
      url += '&lat=$lat&lon=$lon&';
    } else if (zipCode != null && countryCode != null) {
      url += '&zip=$zipCode,$countryCode&';
    }

    url += 'appid=$apiKey&';

    if (language != null) {
      url += 'lang=${languageCodeString[language]}';
    }
    return url;
  }
}
