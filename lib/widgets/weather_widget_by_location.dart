import 'package:flutter/material.dart';
import 'package:open_weather_client/enums/languages.dart';
import 'package:open_weather_client/open_weather.dart';
import 'package:open_weather_client/widgets/modules/location_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_description_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_summary_widget.dart';

/// A widget that displays weather information based on the provided location.
///
/// The [OpenWeatherByLocation] widget fetches and displays weather data for a specific
/// location defined by [latitude] and [longitude]. The weather data is retrieved using
/// the OpenWeather API, and a valid [apiKey] is required to access the API.
///
/// The widget allows customization of the weather units, display color, and language
/// through the [weatherUnits], [color], and [language] properties respectively.
class OpenWeatherByLocation extends StatefulWidget {
  /// The API key required to access the OpenWeather API.
  final String apiKey;

  /// The latitude of the location for which to fetch weather data.
  final double latitude;

  /// The longitude of the location for which to fetch weather data.
  final double longitude;

  /// The units in which to display the weather data.
  ///
  /// Defaults to [WeatherUnits.IMPERIAL].
  final WeatherUnits weatherUnits;

  /// The color to use for displaying the weather data.
  ///
  /// Defaults to [Colors.black].
  final Color color;

  /// The language in which to display the weather data.
  ///
  /// Defaults to [Languages.ENGLISH].
  final Languages language;

  /// Creates an [OpenWeatherByLocation] widget.
  ///
  /// The [apiKey], [latitude], and [longitude] parameters are required.
  /// The [weatherUnits] defaults to [WeatherUnits.IMPERIAL], [color] defaults to [Colors.black],
  /// and [language] defaults to [Languages.ENGLISH].
  const OpenWeatherByLocation({
    super.key,
    required this.apiKey,
    required this.latitude,
    required this.longitude,
    this.weatherUnits = WeatherUnits.IMPERIAL,
    this.color = Colors.black,
    this.language = Languages.ENGLISH,
  });

  @override
  State<OpenWeatherByLocation> createState() => _OpenWeatherByLocationState();
}

class _OpenWeatherByLocationState extends State<OpenWeatherByLocation> {
  late OpenWeather openWeather;

  @override
  void initState() {
    super.initState();
    openWeather = OpenWeather(apiKey: widget.apiKey);
  }

  Future<WeatherData> _getCurrentWeatherByLocation() async {
    return openWeather.currentWeatherByLocation(
        latitude: widget.latitude,
        longitude: widget.longitude,
        weatherUnits: widget.weatherUnits,
        language: widget.language);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCurrentWeatherByLocation(),
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
