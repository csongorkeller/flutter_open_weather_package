import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

@JsonSerializable()

/// A class that represents the coordinates information from the API response.
///
/// This class holds the coordinates related info such as longitude and latitude.
///
/// Example usage:
/// ```dart
/// final coordinates = Coordinates(lon: 12.34, lat: 56.78);
/// print(coordinates.lon); // 12.34
/// print(coordinates.lat); // 56.78
/// ```
///
/// The [Coordinates] class is annotated with [JsonSerializable] to support
/// JSON serialization and deserialization.
///
/// See also:
/// - [Coordinates.fromJson] for creating an instance from a JSON map.
/// - [Coordinates.toJson] for converting an instance to a JSON map.
class Coordinates {
  /// Details class holds the coordinates related info from the API response
  /// [lon] City geo location, longitude
  double lon;

  /// Details class holds the coordinates related info from the API response
  /// [lat] City geo location, latitude
  double lat;

  /// A class representing geographical coordinates.
  ///
  /// The [Coordinates] class is used to store the longitude and latitude
  /// of a specific location.
  ///
  /// Example usage:
  /// ```dart
  /// Coordinates coordinates = Coordinates(lon: 12.34, lat: 56.78);
  /// ```
  ///
  /// Properties:
  /// - `lon` (double): The longitude of the location.
  /// - `lat` (double): The latitude of the location.
  Coordinates({required this.lon, required this.lat});

  /// Creates a [Coordinates] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing key-value pairs that represent
  /// the properties of the [Coordinates] object.
  ///
  /// Returns a [Coordinates] object.
  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);

  /// Converts the [Coordinates] instance to a JSON map.
  ///
  /// Returns a map containing key-value pairs that represent the properties
  /// of the [Coordinates] object.
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
