import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather/models/coordinates.dart';
import 'package:open_weather/models/details.dart';
import 'package:open_weather/models/temperature.dart';
import 'package:open_weather/models/wind.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  @JsonKey(name: 'weather')
  List<Details> details;
  Wind wind;
  @JsonKey(name: 'main')
  Temperature temperature;
  @JsonKey(name: 'coord')
  Coordinates coordinates;
  String name;

  WeatherData({
    this.details,
    this.temperature,
    this.wind,
    this.coordinates,
    this.name,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
