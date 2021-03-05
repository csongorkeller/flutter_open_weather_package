import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class Details {
  /// Details class holds the basic details related info from the API response
  /// [id] holds the weather condition ID
  /// [weatherShortDescription] Group of weather parameters (Rain, Snow, Extreme etc.)
  /// [weatherLongDescription] Weather condition within the group
  /// [icon] Weather icon id
  int id;
  @JsonKey(name: 'main')
  String weatherShortDescription;
  @JsonKey(name: 'description')
  String weatherLongDescription;
  String icon;

  Details(
      {this.id,
      this.weatherShortDescription,
      this.weatherLongDescription,
      this.icon});

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
