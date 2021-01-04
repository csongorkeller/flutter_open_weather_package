import 'package:open_weather/models/temperature.dart';
import 'package:open_weather/models/wind.dart';

import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Weather {
  String weatherStatus;
  String weatherDescription;
  String weatherIcon;
  Temperature temperature = Temperature(
      temp: 0,
      humidity: 0,
      pressure: 0,
      tempFeelsLike: 0,
      tempMax: 0,
      tempMin: 0);
  Wind wind = Wind(speed: 0, deg: 0, gust: 0);

  Weather({
    this.weatherStatus,
    this.weatherDescription,
    this.temperature,
    this.weatherIcon,
    this.wind,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
