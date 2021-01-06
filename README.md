# open_weather

Dart package in order to make use of [OpenWeatherMAP API](https://openweathermap.org/) easily.
The plugin can currently be used to fetch weather data by city name or geolocation(latitude, longitude).

The plugin also supports multiple unit types:  
To receive all data in Fahrenheit, use `WeatherUnits.STANDARD`\
For Celsius, use `WeatherUnits.METRIC`\
For Kelvin use `WeatherUnits.IMPERIAL`

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
#### Accessing values

In order to access the fetched weather values, you can go through each classes holding the specific values.\

The `Coordinates` class holds the following info:

- lat (latitude of the current place retrieved from the API)
- lon (latitude of the current place retrieved from the API)

The `Details` class holds the following info:
`Important! Details class retrieves a List, so you have to loop through it to access it's values.`

- id (default ID coming from the API)
- weatherShortDescription (short description of the current weather conditions coming from the API)
- weatherLongDescription (long description of the current weather conditions coming from the API)
- icon (holds the icon name used by [OpenWeatherMAP API](https://openweathermap.org/weather-conditions))

The `Temperature` class holds the following info:

- currentTemperature (current temperature coming from the API)
- feelsLike (feels like value coming from the API)
- tempMin (minimum temperature value coming from the API)
- tempMax (maximum temperature value coming from the API)
- pressure (air pressure value coming from the API)
- humidity (air humidity value coming from the API)

The `Wind` class holds the following info:

- speed (wind speed value coming from the API)
- deg (wind degree value coming from the API)
- gust (wind gust value coming from the API)

To access them you can do the following:

```dart
WeatherData weatherData = await openWeather
        .currentWeatherByCityName(
            cityName: _cityName, weatherUnits: WeatherUnits.METRIC)
        .catchError((err) => print(err))
        .then((data) {
      print(data.details.first.weatherShortDescription);
      print(data.name.toString());
      print(data.temperature.currentTemperature);
      print(data.wind.speed);
    });
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

For more info and demo implementation check the `example` folder.
