import 'package:flutter/material.dart';
import 'package:open_weather_client/enums/languages.dart';
import 'package:open_weather_client/open_weather.dart';
import 'package:open_weather_client/widgets/modules/location_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_description_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_summary_widget.dart';

/// A widget that displays weather information based on a given zip code and country code.
///
/// This widget provides an easy way to integrate weather data into your application.
/// It requires a valid [apiKey] to fetch the weather data. You can specify the type of
/// weather units using [weatherUnits], the color of the text using [color], and the
/// language of the weather data using [language].
class OpenWeatherByZipCode extends StatefulWidget {
  /// The API key used to fetch weather data.
  final String apiKey;

  /// The zip code for which to fetch weather data.
  final int zipCode;

  /// The country code corresponding to the zip code.
  final String countryCode;

  /// The units in which to display the weather data.
  ///
  /// Defaults to [WeatherUnits.IMPERIAL].
  final WeatherUnits weatherUnits;

  /// The color of the text displaying the weather data.
  ///
  /// Defaults to [Colors.black].
  final Color color;

  /// The language in which to display the weather data.
  ///
  /// Defaults to [Languages.ENGLISH].
  final Languages language;

  /// Creates an instance of [OpenWeatherByZipCode].
  /// The [apiKey], [zipCode], and [countryCode] parameters are required.
  /// The [weatherUnits] defaults to [WeatherUnits.IMPERIAL], the [color] defaults to [Colors.black],
  /// and the [language] defaults to [Languages.ENGLISH].
  const OpenWeatherByZipCode(
      {super.key,
      required this.apiKey,
      required this.zipCode,
      required this.countryCode,
      this.weatherUnits = WeatherUnits.IMPERIAL,
      this.color = Colors.black,
      this.language = Languages.ENGLISH});

  @override
  State<OpenWeatherByZipCode> createState() => _OpenWeatherByZipCodeState();
}

class _OpenWeatherByZipCodeState extends State<OpenWeatherByZipCode> {
  late OpenWeather openWeather;

  @override
  void initState() {
    super.initState();
    openWeather = OpenWeather(apiKey: widget.apiKey);
  }

  Future<WeatherData> _getCurrentWeatherByZipCode() async {
    return openWeather.currentWeatherByZipCode(
        zipCode: widget.zipCode,
        countryCode: widget.countryCode,
        weatherUnits: widget.weatherUnits,
        language: widget.language);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCurrentWeatherByZipCode(),
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
