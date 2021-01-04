import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather/models/main.dart';
import 'package:open_weather/models/weather.dart';
import 'package:open_weather/models/wind.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  List<Weather> weather;
  Wind wind;
  Main main;

  WeatherData({this.weather, this.main, this.wind});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}