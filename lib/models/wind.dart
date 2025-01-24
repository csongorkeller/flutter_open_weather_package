import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable()

/// Wind class holds the wind related info from the API response
class Wind {
  /// [speed] represents the wind speed
  double speed;

  /// [deg] represents Wind direction, degrees (meteorological)
  double deg;

  /// [gust] represents Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  double? gust;

  /// Represents wind data with speed, direction, and optional gust information.
  ///
  /// The [Wind] class contains the following properties:
  /// - [speed]: The speed of the wind.
  /// - [deg]: The direction of the wind in degrees.
  /// - [gust]: An optional value representing the gust speed of the wind.
  Wind({
    required this.speed,
    required this.deg,
    this.gust,
  });

  /// Creates a new instance of [Wind] from a JSON object.
  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  /// Converts the [Wind] object to a JSON object.
  Map<String, dynamic> toJson() => _$WindToJson(this);
}
