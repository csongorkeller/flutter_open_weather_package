import 'dart:math';

import 'package:flutter/material.dart';
import 'package:open_weather_client/models/weather_data.dart';
import 'package:transparent_image/transparent_image.dart';

/// A widget that displays a summary of the current weather, including the current temperature,
/// feels-like temperature, and an icon representing the weather condition.
///
/// The widget uses data from the [WeatherData] object to display the weather information.
/// The overall color scheme can be customized using the [color] property.
class WeatherSummary extends StatelessWidget {
  /// The weather data to be displayed by the widget.
  ///
  /// This property must not be null.
  final WeatherData weatherData;

  /// The color scheme to be used for the text and icons in the widget.
  ///
  /// If null, the default color scheme will be used.
  final Color? color;

  /// Creates a [WeatherSummary] widget.
  ///
  /// The [weatherData] parameter must not be null.
  /// The [color] parameter is optional and can be used to customize the color scheme.
  const WeatherSummary({super.key, required this.weatherData, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Text(
              '${_formatTemperature(weatherData.temperature.currentTemperature)}°',
              style: TextStyle(
                fontSize: 50,
                color: color,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Feels like ${_formatTemperature(weatherData.temperature.feelsLike)}°',
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
            // child: CachedNetworkImage(
            //   imageUrl:
            //       'https://openweathermap.org/img/wn/${this.weatherData.details.first.icon}@2x.png',
            //   /* placeholder: (context, url) => CircularProgressIndicator(
            //     valueColor: AlwaysStoppedAnimation<Color>(color),
            //   ), */
            //   errorWidget: (context, url, error) => Column(
            //     children: [
            //       Icon(
            //         Icons.error,
            //         color: color,
            //       ),
            //       Text(
            //         'Error loading icon',
            //         style: TextStyle(
            //           color: color,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            child: Center(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://openweathermap.org/img/wn/${weatherData.details.first.icon}@2x.png',
                imageErrorBuilder: (context, error, stackTrace) {
                  return Column(
                    children: [
                      Icon(
                        Icons.error,
                        color: color,
                      ),
                      Text(
                        'Error loading icon',
                        style: TextStyle(
                          color: color,
                        ),
                      )
                    ],
                  ); //do something
                },
              ),
            ))
      ]),
    );
  }

  String _formatTemperature(double value, [int places = 1]) {
    double mod = pow(10.0, places).toDouble();
    return ((value * mod).round().toDouble() / mod).toString();
  }
}
