import 'package:flutter_test/flutter_test.dart';

import 'package:open_weather/open_weather.dart';

void main() {
  group('Open Weather unit tests', () {
    setUpAll(() {});
    setUp(() {});

    final double _latitude = 52.0841037;
    final double _longitude = 4.9424092;
    final String _apiKey = 'c4bbb94f9fcfede0eb5219111804b040';
    final String _wrongApiKey = '0';
    final String _cityName = 'Miami';

    final OpenWeather openWeather = OpenWeather(apiKey: _apiKey);
    final OpenWeather wrongOpenWeather = OpenWeather(apiKey: _wrongApiKey);

    test('Fetch weather by CityName', () async {
      WeatherData weatherData =
          await openWeather.currentWeatherByCityName(cityName: _cityName);
      expect(weatherData.name, 'Miami');
    });

    test('Fetch weather by CityName with error due to wrong API credentials',
        () async {
      expect(
          () => wrongOpenWeather.currentWeatherByCityName(cityName: _cityName),
          throwsA(isInstanceOf<Exception>()));
    });

    test('Fetch weather by Location', () async {
      WeatherData weatherData = await openWeather.currentWeatherByLocation(
          latitude: _latitude, longitude: _longitude);
      expect(weatherData.name, 'Gemeente Woerden');
    });

    test('Fetch weather by Location with error due to wrong API credentials',
        () async {
      expect(
          () => wrongOpenWeather.currentWeatherByLocation(
              latitude: _latitude, longitude: _longitude),
          throwsA(isInstanceOf<Exception>()));
    });
  });
}
