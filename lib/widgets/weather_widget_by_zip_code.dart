import 'package:flutter/material.dart';
import 'package:open_weather/enums/weather_units.dart';
import 'package:open_weather/open_weather.dart';
import 'package:open_weather/services/open_weather_api_service.dart';
import 'package:open_weather/widgets/modules/location_view_widget.dart';
import 'package:open_weather/widgets/modules/weather_description_view_widget.dart';
import 'package:open_weather/widgets/modules/weather_summary_widget.dart';

class OpenWeatherByZipCode extends StatefulWidget {
  /// Built in widget to support easy integration.
  /// The widget lists some weather data based on the [zipCode] and [countryCode]
  /// With the help of [weatherUnits] you specify the type of unit.
  /// Please note, in order to use the widget a valid [apiKey] is required.
  /// For more info, read the documentation.
  @required
  final String apiKey;
  @required
  final int zipCode;
  @required
  final String countryCode;
  final WeatherUnits weatherUnits;
  final Color color;
  OpenWeatherByZipCode(
      {this.apiKey,
      this.zipCode,
      this.countryCode,
      this.weatherUnits = WeatherUnits.IMPERIAL,
      this.color = Colors.black});
  @override
  _OpenWeatherByZipCodeState createState() => _OpenWeatherByZipCodeState();
}

class _OpenWeatherByZipCodeState extends State<OpenWeatherByZipCode> {
  OpenWeather openWeather;

  Future<WeatherData> _weatherData;

  @override
  void initState() {
    super.initState();
    openWeather = OpenWeather(apiKey: widget.apiKey);
    _getCurrentWeatherByZipCode();
  }

  Future<WeatherData> _getCurrentWeatherByZipCode() async {
    _weatherData = openWeather
        .currentWeatherByZipCode(
            zipCode: widget.zipCode,
            countryCode: widget.countryCode,
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
