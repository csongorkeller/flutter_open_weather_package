import 'package:flutter/material.dart';
import 'package:open_weather/enums/weather_units.dart';
import 'package:open_weather/open_weather.dart';
import 'package:open_weather/services/open_weather_api_service.dart';
import 'package:open_weather/widgets/modules/location_view_widget.dart';
import 'package:open_weather/widgets/modules/weather_description_view_widget.dart';
import 'package:open_weather/widgets/modules/weather_summary_widget.dart';

class OpenWeatherByLocation extends StatefulWidget {
  @required
  final String apiKey;
  @required
  final double latitude;
  final double longitude;
  final WeatherUnits weatherUnits;
  final Color color;
  OpenWeatherByLocation(
      {this.apiKey,
      this.latitude,
      this.longitude,
      this.weatherUnits = WeatherUnits.IMPERIAL,
      this.color});
  @override
  _OpenWeatherByLocationState createState() => _OpenWeatherByLocationState();
}

class _OpenWeatherByLocationState extends State<OpenWeatherByLocation> {
  OpenWeather openWeather;

  Future<WeatherData> _weatherData;

  @override
  void initState() {
    super.initState();
    openWeather = OpenWeather(apiKey: widget.apiKey);
    _getCurrentweatherByLocation();
  }

  Future<WeatherData> _getCurrentweatherByLocation() async {
    _weatherData = openWeather
        .currentWeatherByLocation(
            latitude: widget.latitude,
            longitude: widget.longitude,
            weatherUnits: WeatherUnits.METRIC)
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
