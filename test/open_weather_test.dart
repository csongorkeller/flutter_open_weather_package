import 'package:flutter_test/flutter_test.dart';

import 'package:open_weather/open_weather.dart';

void main() {
  group('Open Weather unit tests', () {
    setUpAll(() {});
    setUp(() {});

    final double _latitude = 52.0841037;
    final double _longitude = 4.9424092;
    final String _apiKey = 'c4bbb94f9fcfede0eb5219111804b040';
    final String _cityName = 'Miami';

    final OpenWeather openWeather = OpenWeather(apiKey: _apiKey);

    test('Fetch weather by CityName', () async {
      WeatherData weatherData =
          await openWeather.currentWeatherByCityName(cityName: _cityName);
      print('Weather by CityName fetched');
      print(weatherData.weather.first.description);
    });

    test('Fetch weather by Location', () async {
      WeatherData weatherData = await openWeather.currentWeatherByLocation(
          latitude: _latitude, longitude: _longitude);
      print('Weather by Location fetched');
      print(weatherData.weather.first.description);
    });
  });
}
