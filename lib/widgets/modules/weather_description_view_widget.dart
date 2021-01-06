import 'package:flutter/material.dart';
import 'package:open_weather/models/weather_data.dart';

class WeatherDescriptionView extends StatelessWidget {
  final WeatherData weatherData;
  final Color color;

  WeatherDescriptionView({Key key, @required this.weatherData, this.color})
      : assert(weatherData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          this.weatherData.details.first.weatherShortDescription.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            color: color,
          )),
    );
  }
}
