import 'package:example/screens/prebuilt_functions_demo_screen.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_client/enums/languages.dart';
import 'package:open_weather_client/open_weather.dart';

/// A screen that demonstrates the use of prebuilt widgets from the OpenWeather package.
class PrebuiltWidgetsScreen extends StatefulWidget {
  /// Creates a [PrebuiltWidgetsScreen].
  const PrebuiltWidgetsScreen({super.key});

  @override
  State<PrebuiltWidgetsScreen> createState() => _PrebuiltWidgetsScreenState();
}

class _PrebuiltWidgetsScreenState extends State<PrebuiltWidgetsScreen> {
  /// The name of the city for which to display weather information.
  final String _cityName = 'Miami';

  /// The API key for accessing the OpenWeather API.
  final String _key = 'c4bbb94f9fcfede0eb5219111804b040';

  /// The latitude of the location for which to display weather information.
  final double _latitude = 52.3545828;

  /// The longitude of the location for which to display weather information.
  final double _longitude = 4.7638781;

  /// Builds a button that navigates to the [PrebuiltFunctionScreen].
  Widget _buildButton() {
    return ElevatedButton(
      child: const Text('Check with prebuilt functions'),
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const PrebuiltFunctionScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            'OpenWeather prebuilt widgets',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OpenWeatherByCity(
                  apiKey: _key,
                  cityName: _cityName,
                  weatherUnits: WeatherUnits.METRIC,
                  color: Colors.white,
                  language: Languages.GERMAN),
              const Divider(
                thickness: 1,
                color: Colors.white,
              ),
              OpenWeatherByLocation(
                apiKey: _key,
                latitude: _latitude,
                longitude: _longitude,
                weatherUnits: WeatherUnits.METRIC,
                language: Languages.GERMAN,
                color: Colors.white,
              ),
              _buildButton()
            ],
          ),
        ));
  }
}
