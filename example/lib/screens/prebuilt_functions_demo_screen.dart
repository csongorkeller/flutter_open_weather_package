import 'package:example/modules/location_view_widget.dart';
import 'package:example/modules/weather_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_client/open_weather.dart';

class PrebuiltFunctionScreen extends StatefulWidget {
  const PrebuiltFunctionScreen({super.key});

  @override
  State<PrebuiltFunctionScreen> createState() => _PrebuiltFunctionScreenState();
}

class _PrebuiltFunctionScreenState extends State<PrebuiltFunctionScreen> {
  late OpenWeather openWeather;

  final String _cityName = 'Sunshine Beach';
  final String _countryCode = 'AU';
  final String _key = 'c4bbb94f9fcfede0eb5219111804b040';
  final double _latitude = -26.4042;
  final double _longitude = 153.1022;
  final int _zipCode = 4567;

  @override
  void initState() {
    super.initState();
    openWeather = OpenWeather(apiKey: _key);

    // _getFiveDaysForecastByCityName().then((value) {
    //   value.forecastData.forEach((element) {
    //     print(element.temperature.currentTemperature);
    //     print(element.date.toString());
    //   });
    // });
  }

  // ignore: unused_element
  Future<WeatherData> _getCurrentweatherByCity() async {
    return openWeather.currentWeatherByCityName(
        cityName: _cityName, weatherUnits: WeatherUnits.METRIC);
  }

  // ignore: unused_element
  Future<WeatherData> _getCurrentweatherByLocation() async {
    return openWeather.currentWeatherByLocation(
        latitude: _latitude,
        longitude: _longitude,
        weatherUnits: WeatherUnits.METRIC);
  }

  Future<WeatherData> _getCurrentweatherByZipCode() async {
    return openWeather.currentWeatherByZipCode(
        zipCode: _zipCode,
        countryCode: _countryCode,
        weatherUnits: WeatherUnits.METRIC);
  }

  // ignore: unused_element
  Future<WeatherForecastData> _getFiveDaysForecastByCityName() async {
    return openWeather.fiveDaysWeatherForecastByCityName(
        cityName: _cityName, weatherUnits: WeatherUnits.METRIC);
  }

  // ignore: unused_element
  Future<WeatherForecastData> _getFiveDaysForecastByLocation() async {
    return openWeather.fiveDaysWeatherForecastByLocation(
        latitude: _latitude,
        longitude: _longitude,
        weatherUnits: WeatherUnits.METRIC);
  }

  // ignore: unused_element
  Future<WeatherForecastData> _getFiveDaysForecastByZipCode() async {
    return openWeather.fiveDaysWeatherForecastByZipCode(
        zipCode: _zipCode,
        countryCode: _countryCode,
        weatherUnits: WeatherUnits.METRIC);
  }

  Widget _buildButton() {
    return ElevatedButton(
      child: const Text('Check with prebuilt widgets'),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('OpenWeather prebuilt functions',
            style: TextStyle(color: Colors.black),
            maxLines: 2,
            textAlign: TextAlign.center),
      ),
      body: Container(
          width: double.infinity,
          color: Colors.white,
          child: FutureBuilder(
              future: _getCurrentweatherByZipCode(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LocationViewWidget(
                        title: snapshot.data!.name ?? '',
                        color: Colors.black,
                      ),
                      WeatherSummary(
                        color: Colors.black,
                        imageUrl:
                            'https://openweathermap.org/img/wn/${snapshot.data!.details.first.icon}@2x.png',
                        currentTemperature: snapshot
                            .data!.temperature.currentTemperature
                            .toString(),
                        maxTemperature:
                            snapshot.data!.temperature.tempMax.toString(),
                        minTemperature:
                            snapshot.data!.temperature.tempMin.toString(),
                        humidity:
                            snapshot.data!.temperature.humidity.toString(),
                        pressure:
                            snapshot.data!.temperature.pressure.toString(),
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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
