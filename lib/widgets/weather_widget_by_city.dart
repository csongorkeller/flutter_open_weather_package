import 'package:flutter/material.dart';
import 'package:open_weather/enums/weather_units.dart';
import 'package:open_weather/open_weather.dart';
import 'package:open_weather/services/open_weather_api_service.dart';
import 'package:open_weather/widgets/modules/location_view_widget.dart';
import 'package:open_weather/widgets/modules/weather_description_view_widget.dart';
import 'package:open_weather/widgets/modules/weather_summary_widget.dart';

class OpenWeatherByCity extends StatefulWidget {
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
      this.color});
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
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
