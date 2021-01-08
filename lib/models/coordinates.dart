import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

@JsonSerializable()

/// Details class holds the coordinates related info from the API response
/// [lon] City geo location, longitude
/// [lat] City geo location, latitude
class Coordinates {
  double lon;
  double lat;

  Coordinates({this.lon, this.lat});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
