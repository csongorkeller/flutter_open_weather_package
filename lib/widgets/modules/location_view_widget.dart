import 'package:flutter/material.dart';
import 'package:open_weather/models/weather_data.dart';

class LocationView extends StatelessWidget {
  final WeatherData weatherData;
  final Color color;

  LocationView({
    Key key,
    @required this.weatherData,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text('${this.weatherData.name.toUpperCase()}',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w300,
              color: color,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: color, size: 15),
            SizedBox(width: 10),
            Text(this.weatherData.coord.lat.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                )),
            Text(' , ',
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                )),
            Text(this.weatherData.coord.lon.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                )),
          ],
        )
      ]),
    );
  }
}
