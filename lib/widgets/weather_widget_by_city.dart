import 'package:flutter/material.dart';
import 'package:open_weather_client/enums/languages.dart';
import 'package:open_weather_client/open_weather.dart';
import 'package:open_weather_client/widgets/modules/location_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_description_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_summary_widget.dart';

/// A widget that displays weather information for a specified city.
///
/// This widget provides an easy way to integrate weather data into your application.
/// It displays weather information based on the provided [cityName].
///
/// To use this widget, you must provide a valid [apiKey].
/// You can specify the unit of measurement for the weather data using [weatherUnits].
/// The default unit is [WeatherUnits.IMPERIAL].
///
/// You can also customize the color of the displayed text using [color] and the language
/// of the weather information using [language].
///
/// For more information, please refer to the documentation.
class OpenWeatherByCity extends StatefulWidget {
  /// The API key required to fetch weather data.
  final String apiKey;

  /// The name of the city for which to display weather information.
  final String cityName;

  /// The unit of measurement for the weather data.
  /// The default value is [WeatherUnits.IMPERIAL].
  final WeatherUnits weatherUnits;

  /// The color of the displayed text.
  /// The default value is [Colors.black].
  final Color color;

  /// The language of the weather information.
  /// The default value is [Languages.ENGLISH].
  final Languages language;

  /// Creates an [OpenWeatherByCity] widget.
  ///
  /// The [apiKey] and [cityName] parameters are required.
  ///
  /// The [weatherUnits] parameter specifies the unit of measurement for the weather data.
  /// The default value is [WeatherUnits.IMPERIAL].
  ///
  /// The [color] parameter specifies the color of the displayed text.
  /// The default value is [Colors.black].
  ///
  /// The [language] parameter specifies the language of the weather information.
  /// The default value is [Languages.ENGLISH].
  const OpenWeatherByCity(
      {super.key,
      required this.apiKey,
      required this.cityName,
      this.weatherUnits = WeatherUnits.IMPERIAL,
      this.color = Colors.black,
      this.language = Languages.ENGLISH});

  @override
  State<OpenWeatherByCity> createState() => _OpenWeatherByCityState();
}

/// The `_OpenWeatherByCityState` class is a state class for the `OpenWeatherByCity` widget.
/// It manages the state and behavior of the `OpenWeatherByCity` widget,
/// including fetching and displaying weather information for a specified city.
class _OpenWeatherByCityState extends State<OpenWeatherByCity> {
  late OpenWeather openWeather;

  @override
  void initState() {
    super.initState();
    openWeather = OpenWeather(apiKey: widget.apiKey);
  }

  Future<WeatherData> _getCurrentWeatherByCity() async {
    WeatherData wd = await openWeather.currentWeatherByCityName(
        cityName: widget.cityName,
        weatherUnits: widget.weatherUnits,
        language: widget.language);
    return wd;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCurrentWeatherByCity(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LocationView(
                weatherData: snapshot.data!,
                color: widget.color,
              ),
              WeatherSummary(
                weatherData: snapshot.data!,
                color: widget.color,
              ),
              WeatherDescriptionView(
                weatherData: snapshot.data!,
                color: widget.color,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
              child: Text(
            'Oops something went wrong!',
            style: TextStyle(color: widget.color),
          ));
        }
        return Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(widget.color),
        ));
      },
    );
  }
}
