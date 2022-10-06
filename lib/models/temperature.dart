import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable()
class Temperature {
  /// Temperature class holds the temperature related info from the API response
  /// [currentTemperature] holds the current temperature
  /// [feelsLike] Temperature. This temperature parameter accounts for the human perception of weather.
  /// [tempMin] Minimum temperature at the moment of calculation. This is minimal currently observed temperature
  /// [tempMax] Maximum temperature at the moment of calculation. This is maximal currently observed temperature
  /// [pressure] holds the pressure value
  /// [humidity] holds the humidity value
  @JsonKey(name: 'temp')
  double currentTemperature;
  @JsonKey(name: 'feels_like')
  double feelsLike;
  @JsonKey(name: 'temp_min')
  double tempMin;
  @JsonKey(name: 'temp_max')
  double tempMax;
  int pressure;
  int humidity;

  Temperature({
    required this.currentTemperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
