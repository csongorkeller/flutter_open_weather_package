import 'package:flutter/material.dart';
import 'package:open_weather_client/models/weather_data.dart';

/// A widget that displays the name and geo-coordinates of a location.
///
/// The [LocationView] widget is designed to provide an easy integration for displaying
/// location information, including the name and geo-coordinates (latitude and longitude).
///
/// The widget requires a non-null [WeatherData] object to function properly.
///
/// The [color] parameter can be used to specify the overall color scheme of the widget.
///
/// Example usage:
/// ```dart
/// LocationView(
///   weatherData: weatherData,
///   color: Colors.blue,
/// )
/// ```
///
/// See also:
/// - [WeatherData], which provides the necessary data for this widget.
/// Built in widget to support easy integration.
/// The widget lists the name of the location and the geo-coordinates of it
class LocationView extends StatelessWidget {
  /// Please note, in order to use the widget [weatherData] should not be null.
  final WeatherData weatherData;

  /// With the help of [color] you specify the overall color scheme.
  final Color? color;

  /// A widget that displays the location view with weather data.
  ///
  /// The [LocationView] widget requires [weatherData] to be provided and optionally
  /// accepts a [color] to customize its appearance.
  ///
  /// Parameters:
  /// - [weatherData]: The weather data to be displayed.
  /// - [color]: An optional color to customize the appearance of the widget.
  const LocationView({
    super.key,
    required this.weatherData,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(weatherData.name?.toUpperCase() ?? '',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w300,
              color: color,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: color, size: 15),
            const SizedBox(width: 10),
            Text(weatherData.coordinates?.lat.toString() ?? '',
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                )),
            Text(' , ',
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                )),
            Text(weatherData.coordinates?.lon.toString() ?? '',
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
