import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable()

/// Temperature class holds the temperature related info from the API response
/// Properties:
/// - [currentTemperature]: The current temperature.
/// - [feelsLike]: The temperature as perceived by humans.
/// - [tempMin]: The minimum recorded temperature.
/// - [tempMax]: The maximum recorded temperature.
/// - [pressure]: The atmospheric pressure.
/// - [humidity]: The humidity level.
class Temperature {
  /// [currentTemperature] holds the current temperature
  @JsonKey(name: 'temp')
  double currentTemperature;

  /// [feelsLike] Temperature. This temperature parameter accounts for the human perception of weather.
  @JsonKey(name: 'feels_like')
  double feelsLike;

  /// [tempMin] Minimum temperature at the moment of calculation. This is minimal currently observed temperature
  @JsonKey(name: 'temp_min')
  double tempMin;

  /// [tempMax] Maximum temperature at the moment of calculation. This is maximal currently observed temperature
  @JsonKey(name: 'temp_max')
  double tempMax;

  /// [pressure] holds the pressure value
  int pressure;

  /// [humidity] holds the humidity value
  int humidity;

  /// A class representing temperature-related data.
  ///
  /// The [Temperature] class holds information about the current temperature,
  /// feels-like temperature, minimum and maximum temperatures, atmospheric pressure,
  /// and humidity.
  ///
  /// Properties:
  /// - [currentTemperature]: The current temperature.
  /// - [feelsLike]: The temperature as perceived by humans.
  /// - [tempMin]: The minimum recorded temperature.
  /// - [tempMax]: The maximum recorded temperature.
  /// - [pressure]: The atmospheric pressure.
  /// - [humidity]: The humidity level.
  Temperature({
    required this.currentTemperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  /// Factory constructor to create a Temperature instance from a JSON map.
  factory Temperature.fromJson(Map<String, dynamic> json) => _$TemperatureFromJson(json);

  /// Method to convert a Temperature instance to a JSON map.
  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
