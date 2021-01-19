import 'package:flutter/material.dart';
import 'package:open_weather_client/models/weather_data.dart';

class WeatherDescriptionView extends StatelessWidget {
  /// Built in widget to support easy integration.
  /// The widget lists the current weather condition as a String
  /// With the help of [color] you specify the overall color scheme.
  /// Please note, in order to use the widget [weatherData] should not be null.
  /// For more info, read the documentation.
  final WeatherData weatherData;
  final Color color;

  WeatherDescriptionView({Key key, @required this.weatherData, this.color})
      : assert(weatherData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          this
                  .weatherData
                  .details
                  .first
                  .weatherShortDescription
                  .toUpperCase() ??
              '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            color: color,
          )),
    );
  }
}
