import 'package:flutter/material.dart';
import 'package:open_weather/models/weather_data.dart';

class WeatherSummary extends StatelessWidget {
  final WeatherData weatherData;
  final Color color;

  WeatherSummary({Key key, @required this.weatherData, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Text(
              '${_formatTemperature(this.weatherData.main.temp)}°',
              style: TextStyle(
                fontSize: 50,
                color: color,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Feels like ${_formatTemperature(this.weatherData.main.feelsLike)}°',
              style: TextStyle(
                fontSize: 18,
                color: color,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.network(
                'http://openweathermap.org/img/wn/${this.weatherData.weather.first.icon}@2x.png'))
      ]),
    );
  }

  String _formatTemperature(double t) {
    var temp = (t == null ? '' : t.round().toString());
    return temp;
  }
}
