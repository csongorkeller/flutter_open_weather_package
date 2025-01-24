import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/// A widget that displays a summary of the weather information.
///
/// The [WeatherSummary] widget shows an image representing the weather,
/// the current temperature, maximum and minimum temperatures, humidity,
/// and pressure.
///
/// The widget requires the following parameters:
/// - [imageUrl]: The URL of the image representing the weather.
/// - [currentTemperature]: The current temperature.
/// - [color]: The color to be used for the text and icons.
/// - [maxTemperature]: The maximum temperature.
/// - [minTemperature]: The minimum temperature.
/// - [humidity]: The humidity percentage.
/// - [pressure]: The atmospheric pressure in hPa.
class WeatherSummary extends StatelessWidget {
  /// The [WeatherSummary] widget shows an image representing the weather,
  /// the current temperature, maximum and minimum temperatures, humidity,
  /// and pressure.
  const WeatherSummary({
    super.key,
    required this.imageUrl,
    required this.currentTemperature,
    required this.color,
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidity,
    required this.pressure,
  });

  /// The color to be used for the text and icons.
  final Color color;

  /// The current temperature.
  final String currentTemperature;

  /// The humidity percentage.
  final String humidity;

  /// The URL of the image representing the weather.
  final String imageUrl;

  /// The maximum temperature.
  final String maxTemperature;

  /// The minimum temperature.
  final String minTemperature;

  /// The atmospheric pressure in hPa.
  final String pressure;

  /// Builds a row displaying an icon and a temperature.
  ///
  /// The [icon] parameter specifies the icon to be displayed.
  /// The [temperature] parameter specifies the temperature to be displayed.
  Widget _buildMinMaxRow({
    required IconData icon,
    required String temperature,
  }) {
    return Row(
      children: [
        Icon(icon),
        Text('$temperature°',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: color,
            )),
      ],
    );
  }

  /// Builds a row displaying the humidity and pressure.
  ///
  /// The [humidity] parameter specifies the humidity percentage to be displayed.
  /// The [pressure] parameter specifies the atmospheric pressure to be displayed.
  Widget _buildHumidutyAndPressureRow({
    required String humidity,
    required String pressure,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('$pressure hPa',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: color,
            )),
        Text('$humidity %',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: color,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: imageUrl,
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
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('${currentTemperature.toUpperCase()}°',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w300,
                color: color,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: _buildMinMaxRow(icon: Icons.arrow_drop_up_sharp, temperature: maxTemperature),
              ),
              Container(
                child: _buildMinMaxRow(icon: Icons.arrow_drop_down_sharp, temperature: minTemperature),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: _buildHumidutyAndPressureRow(humidity: humidity, pressure: pressure),
        )
      ],
    );
  }
}
