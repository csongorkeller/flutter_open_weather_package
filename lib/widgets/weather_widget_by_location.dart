import 'package:flutter/material.dart';
import 'package:open_weather_client/enums/weather_units.dart';
import 'package:open_weather_client/open_weather.dart';
import 'package:open_weather_client/services/open_weather_api_service.dart';
import 'package:open_weather_client/widgets/modules/location_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_description_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_summary_widget.dart';

class OpenWeatherByLocation extends StatefulWidget {
  /// Built in widget to support easy integration.
  /// The widget lists some weather data based on the [latitude] and [longitude]
  /// With the help of [weatherUnits] you specify the type of unit.
  /// Please note, in order to use the widget a valid [apiKey] is required.
  /// For more info, read the documentation.
  @required
  final String apiKey;
  @required
  final double latitude;
  @required
  final double longitude;
  final WeatherUnits weatherUnits;
  final Color color;
  OpenWeatherByLocation(
      {this.apiKey,
      this.latitude,
      this.longitude,
      this.weatherUnits = WeatherUnits.IMPERIAL,
      this.color = Colors.black});
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
      // ignore: return_of_invalid_type_from_catch_error
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
