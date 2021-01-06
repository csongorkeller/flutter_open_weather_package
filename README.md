# open_weather

Dart package in order to make use of [OpenWeatherMAP API](https://openweathermap.org/) easily.
The plugin can currently be used to fetch weather data by city name or geolocation(latitude, longitude).

The plugin also supports multiple unit types:  
To receive all data in Fahrenheit, use `weatherUnits: WeatherUnits.STANDARD`\
For Celsius, use `weatherUnits: WeatherUnits.METRIC`\
For Kelvin use `weatherUnits: WeatherUnits.IMPERIAL`

## Install package

To install the dependency, add `open_weather` to your `pubspec.yaml`.

## Usage

### Prebuilt functions

Before you can use the plugin, you need an API key from [OpenWeatherMAP](https://openweathermap.org/). The plugin only uses those endpoints that can be acquired for free.

Once you have the API key, do the following:

```dart
import 'package:open_weather/open_weather.dart';

...

OpenWeather openWeather =  OpenWeather(apiKey: "YOUR_API_KEY");
```

The current weather is fetched through the city name or geolocation.

```dart
  final String _key = 'YOUR_API_KEY';
  final String _cityName = 'Florida';
  final double _latitude = 52.3545828;
  final double _longitude = 4.7638781;
```

For fetching through city name, you can do the following:

```dart
  WeatherData weatherData = await openWeather
        .currentWeatherByCityName(
            cityName: _cityName, weatherUnits: WeatherUnits.METRIC)
        .catchError((err) => print(err));
```

For fetching through geolocation, you can do the following:

```dart
  WeatherData weatherData = await openWeather
        .currentWeatherByLocation(
            latitude: _latitude,
            longitude: _longitude,
            weatherUnits: WeatherUnits.METRIC)
        .catchError((err) => print(err));
```
### Prebuilt widgets
Alternativel you can use the built in widgets to populate your app with some nice UI showing weather insights:

For fetching through city name, you can do the following:

```dart
 OpenWeatherByCity(
                apiKey: _key,
                cityName: _cityName,
                weatherUnits: WeatherUnits.METRIC,
                color: Colors.white,
              )
```

For fetching through geolocation, you can do the following:

```dart
OpenWeatherByLocation(
                apiKey: _key,
                latitude: _latitude,
                longitude: _longitude,
                weatherUnits: WeatherUnits.METRIC,
                color: Colors.white,
              )

```
