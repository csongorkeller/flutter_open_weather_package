import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class Details {
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
