import 'package:example/modules/location_view_widget.dart';
import 'package:example/modules/weather_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:open_weather/open_weather.dart';

class PrebuiltFunctionScreen extends StatefulWidget {
  @override
  _PrebuiltFunctionScreenState createState() => _PrebuiltFunctionScreenState();
}

class _PrebuiltFunctionScreenState extends State<PrebuiltFunctionScreen> {
  OpenWeather openWeather;

  final String _key = 'c4bbb94f9fcfede0eb5219111804b040';
  final double _latitude = 40.0292888;
  final double _longitude = -105.3100169;
  final int _zipCode = 3512;
  final String _countryCode = 'NL';
  Future<WeatherData> _weatherData;

  //final String _cityName = 'Florida';

  @override
  void initState() {
    super.initState();
    openWeather = OpenWeather(apiKey: _key);
    _getCurrentweatherByZipCode();
  }

  // Future<WeatherData> getCurrentweatherByCity() async {
  //   _weatherData = openWeather.currentWeatherByCityName(
  //       cityName: _cityName, weatherUnits: WeatherUnits.METRIC);

  //   return _weatherData;
  // }

  // Future<WeatherData> _getCurrentweatherByLocation() async {
  //   _weatherData = openWeather.currentWeatherByLocation(
  //       latitude: _latitude,
  //       longitude: _longitude,
  //       weatherUnits: WeatherUnits.METRIC);

  //   return _weatherData;
  // }

  Future<WeatherData> _getCurrentweatherByZipCode() async {
    _weatherData = openWeather.currentWeatherByZipCode(
        zipCode: _zipCode,
        countryCode: _countryCode,
        weatherUnits: WeatherUnits.METRIC);

    return _weatherData;
  }

  Widget _buildButton() {
    return RaisedButton(
      child: Text('Check with prebuilt widgets'),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('OpenWeather prebuilt functions',
            style: TextStyle(color: Colors.black),
            maxLines: 2,
            textAlign: TextAlign.center),
      ),
      body: Container(
          width: double.infinity,
          color: Colors.white,
          child: FutureBuilder(
              future: _weatherData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LocationViewWidget(
                        title: snapshot.data.name,
                        color: Colors.black,
                      ),
                      WeatherSummary(
                        color: Colors.black,
                        imageUrl:
                            'http://openweathermap.org/img/wn/${snapshot.data.details.first.icon}@2x.png',
                        currentTemperature: snapshot
                            .data.temperature.currentTemperature
                            .toString(),
                        maxTemperature:
                            snapshot.data.temperature.tempMax.toString(),
                        minTemperature:
                            snapshot.data.temperature.tempMin.toString(),
                        humidity: snapshot.data.temperature.humidity.toString(),
                        pressure: snapshot.data.temperature.pressure.toString(),
                      ),
                      _buildButton()
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
