import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Temperature {
  double temp;
  double tempFeelsLike;
  double tempMin;
  double tempMax;
  double pressure;
  double humidity;

  Temperature(
      {@required this.temp,
      @required this.humidity,
      @required this.pressure,
      @required this.tempFeelsLike,
      @required this.tempMax,
      @required this.tempMin});

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
