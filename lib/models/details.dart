import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()

/// The `Details` class represents the basic weather details obtained from the API response.
///
/// This class includes information such as the weather condition ID, a short description of the weather,
/// a more detailed description, and the weather icon ID.
///
/// Properties:
/// - `id` (int): The unique identifier for the weather condition.
/// - `weatherShortDescription` (String): A brief description of the weather parameters (e.g., Rain, Snow, Extreme).
/// - `weatherLongDescription` (String): A detailed description of the weather condition within the group.
/// - `icon` (String): The identifier for the weather icon.

class Details {
  /// [id] holds the weather condition ID
  int id;

  /// [weatherShortDescription] Group of weather parameters (Rain, Snow, Extreme etc.)
  @JsonKey(name: 'main')
  String weatherShortDescription;

  /// [weatherLongDescription] Weather condition within the group
  @JsonKey(name: 'description')
  String weatherLongDescription;

  /// [icon] Weather icon id
  String icon;

  /// A class representing the details of weather information.
  ///
  /// This class includes the following properties:
  /// - `id`: The unique identifier for the weather details.
  /// - `weatherShortDescription`: A short description of the weather.
  /// - `weatherLongDescription`: A detailed description of the weather.
  /// - `icon`: The icon representing the weather.
  Details(
      {required this.id,
      required this.weatherShortDescription,
      required this.weatherLongDescription,
      required this.icon});

  /// Creates a [Details] instance from a JSON object.`
  factory Details.fromJson(Map<String, dynamic> json) => _$DetailsFromJson(json);

  /// Converts the [Details] instance to a JSON object.
  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
