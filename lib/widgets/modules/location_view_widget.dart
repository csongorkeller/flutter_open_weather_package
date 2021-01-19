import 'package:flutter/material.dart';
import 'package:open_weather_client/models/weather_data.dart';

class LocationView extends StatelessWidget {
  /// Built in widget to support easy integration.
  /// The widget lists the name of the location and the geo-coordinates of it
  /// With the help of [color] you specify the overall color scheme.
  /// Please note, in order to use the widget [weatherData] should not be null.
  /// For more info, read the documentation.
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
        Text('${this.weatherData.name.toUpperCase()}' ?? '',
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
            Text(this.weatherData.coordinates.lat.toString() ?? '',
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                )),
            Text(' , ',
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                )),
            Text(this.weatherData.coordinates.lon.toString() ?? '',
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
