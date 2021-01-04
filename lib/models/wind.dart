import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Wind {
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
