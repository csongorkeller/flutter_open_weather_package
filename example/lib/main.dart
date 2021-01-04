import 'package:flutter/material.dart';
import 'package:open_weather/models/weather_data.dart';
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
    openWeather = OpenWeather(apiKey: _key);
    getCurrentweatherByCity().then((weatherData) {
      // print(weatherData.temperature);
      print('WEATHER RESPONSE: ${weatherData.main.temp}');
    }).catchError(
        (_) => print('Oops, something went wrong, check your API key!'));
  }

  Future<WeatherData> getCurrentweatherByCity() async {
    WeatherData weatherData =
        await openWeather.currentWeatherByCityName(cityName: 'Utrecht');

    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'something',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
