import 'package:flutter/material.dart';
import 'package:open_weather_client/open_weather.dart';
import 'package:open_weather_client/widgets/modules/location_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_description_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_summary_widget.dart';

class OpenWeatherByCity extends StatefulWidget {
  /// Built in widget to support easy integration.
  /// The widget lists some weather data based on the [cityName]
  /// With the help of [weatherUnits] you specify the type of unit.
  /// Please note, in order to use the widget a valid [apiKey] is required.
  /// For more info, read the documentation.
  final String apiKey;
  final String cityName;
  final WeatherUnits weatherUnits;
  final Color color;
  const OpenWeatherByCity(
      {super.key,
      required this.apiKey,
      required this.cityName,
      this.weatherUnits = WeatherUnits.IMPERIAL,
      this.color = Colors.black});
  @override
  State<OpenWeatherByCity> createState() => _OpenWeatherByCityState();
}

class _OpenWeatherByCityState extends State<OpenWeatherByCity> {
  late OpenWeather openWeather;

  @override
  void initState() {
    super.initState();
    openWeather = OpenWeather(apiKey: widget.apiKey);
  }

  Future<WeatherData> getCurrentweatherByCity() async {
    WeatherData wd = await openWeather.currentWeatherByCityName(
        cityName: widget.cityName, weatherUnits: widget.weatherUnits);
    return wd;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCurrentweatherByCity(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LocationView(
                weatherData: snapshot.data!,
                color: widget.color,
              ),
              WeatherSummary(
                weatherData: snapshot.data!,
                color: widget.color,
              ),
              WeatherDescriptionView(
                weatherData: snapshot.data!,
                color: widget.color,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
              child: Text(
            'Oops something went wrong!',
            style: TextStyle(color: widget.color),
          ));
        }
        return Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(widget.color),
        ));
      },
    );
  }
}
