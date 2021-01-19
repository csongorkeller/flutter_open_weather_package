import 'package:flutter/material.dart';
import 'package:open_weather_client/enums/weather_units.dart';
import 'package:open_weather_client/open_weather.dart';
import 'package:open_weather_client/services/open_weather_api_service.dart';
import 'package:open_weather_client/widgets/modules/location_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_description_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_summary_widget.dart';

class OpenWeatherByCity extends StatefulWidget {
  /// Built in widget to support easy integration.
  /// The widget lists some weather data based on the [cityName]
  /// With the help of [weatherUnits] you specify the type of unit.
  /// Please note, in order to use the widget a valid [apiKey] is required.
  /// For more info, read the documentation.
  @required
  final String apiKey;
  @required
  final String cityName;
  final WeatherUnits weatherUnits;
  final Color color;
  OpenWeatherByCity(
      {this.apiKey,
      this.cityName,
      this.weatherUnits = WeatherUnits.IMPERIAL,
      this.color = Colors.black});
  @override
  _OpenWeatherByCityState createState() => _OpenWeatherByCityState();
}

class _OpenWeatherByCityState extends State<OpenWeatherByCity> {
  OpenWeather openWeather;

  Future<WeatherData> _weatherData;

  @override
  void initState() {
    super.initState();
    openWeather = OpenWeather(apiKey: widget.apiKey);
    getCurrentweatherByCity();
  }

  Future<WeatherData> getCurrentweatherByCity() async {
    _weatherData = openWeather
        .currentWeatherByCityName(
            cityName: widget.cityName, weatherUnits: widget.weatherUnits)
        .catchError((err) {
      print(err);
      return err;
    });

    return _weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _weatherData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LocationView(
                weatherData: snapshot.data,
                color: widget.color,
              ),
              WeatherSummary(
                weatherData: snapshot.data,
                color: widget.color,
              ),
              WeatherDescriptionView(
                weatherData: snapshot.data,
                color: widget.color,
              ),
            ],
          ));
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
