import 'package:flutter/material.dart';
import 'package:open_weather_client/models/weather_data.dart';

/// A widget that displays the current weather condition as a string.
///
/// The [WeatherDescriptionView] widget provides an easy way to integrate
/// weather information into your application. It displays the weather
/// condition in uppercase text, centered on the screen.
///
/// The [weatherData] parameter must not be null and should contain the
/// weather information to be displayed.
///
/// The [color] parameter allows you to specify the overall color scheme
/// of the text.
///
/// For more information, refer to the documentation.
class WeatherDescriptionView extends StatelessWidget {
  /// The weather data to be displayed.
  ///
  /// This parameter must not be null.
  final WeatherData weatherData;

  /// The color scheme for the text.
  ///
  /// This parameter is optional. If not provided, the default color will be used.
  final Color? color;

  /// Creates a [WeatherDescriptionView] widget.
  ///
  /// The [weatherData] parameter must not be null.
  /// The [color] parameter is optional.
  const WeatherDescriptionView({
    super.key,
    required this.weatherData,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(weatherData.details.first.weatherShortDescription.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            color: color,
          )),
    );
  }
}
