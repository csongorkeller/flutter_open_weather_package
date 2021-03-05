import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable()
class Wind {
  /// Wind class holds the wind related info from the API response
  /// [speed] represents the wind speed
  /// [deg] represents Wind direction, degrees (meteorological)
  /// [gust] represents Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  double speed;
  double deg;
  double gust;

  Wind({
    @required this.speed,
    @required this.deg,
    @required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}
