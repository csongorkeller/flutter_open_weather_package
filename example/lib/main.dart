import 'package:flutter/material.dart';
import 'package:open_weather/open_weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _key = 'c4bbb94f9fcfede0eb5219111804b040';
  OpenWeather openWeather;

  @override
  void initState() {
    super.initState();
    /* openWeather = OpenWeather(apiKey: _key);
    getCurrentweatherByCity().then((weatherData) {
      print(weatherData.main.pressure);
    }); */

    /* getCurrentweatherByLocation().then((weatherData) {
      print(weatherData.main.temp);
    }); */
  }

  Future<WeatherData> getCurrentweatherByCity() async {
    WeatherData weatherData = await openWeather
        .currentWeatherByCityName(
            cityName: 'Utrecht', weatherUnits: WeatherUnits.METRIC)
        .catchError((err) => print(err));

    return weatherData;
  }

  Future<WeatherData> getCurrentweatherByLocation() async {
    WeatherData weatherData = await openWeather
        .currentWeatherByLocation(
            latitude: 52.0841037,
            longitude: 4.9424092,
            weatherUnits: WeatherUnits.METRIC)
        .catchError((err) => print(err));

    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            'Demo By City Name',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OpenWeatherByCity(
                apiKey: _key,
                cityName: 'Moscow',
                weatherUnits: WeatherUnits.METRIC,
                color: Colors.white,
              ),
              OpenWeatherByLocation(
                apiKey: _key,
                latitude: 52.0841037,
                longitude: 4.9424092,
                weatherUnits: WeatherUnits.METRIC,
                color: Colors.white,
              ),
              _buildButton()
            ],
          ),
        ));
  }

  Widget _buildButton() {
    return RaisedButton(
      child: Text('Check with location'),
      onPressed: () {},
    );
  }
}
