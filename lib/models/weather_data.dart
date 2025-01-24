import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather_client/models/coordinates.dart';
import 'package:open_weather_client/models/details.dart';
import 'package:open_weather_client/models/temperature.dart';
import 'package:open_weather_client/models/wind.dart';

part 'weather_data.g.dart';

@JsonSerializable()

/// Generic class to hold all the data being extracted from the API response
class WeatherData {
  /// Holds weather basic details as a list
  @JsonKey(name: 'weather')
  List<Details> details;

  /// Holds wind related details as an object
  Wind wind;

  /// Holds temperature related details as an object
  @JsonKey(name: 'main')
  Temperature temperature;

  /// Holds coordinates of the place
  @JsonKey(name: 'coord')
  Coordinates? coordinates;

  /// Extracts the name of the identified place from the API response
  String? name;

  /// Holds the date of the weather data
  @JsonKey(name: 'dt')
  int date;

  /// Constructor for initializing the WeatherData object
  WeatherData({
    required this.details,
    required this.temperature,
    required this.wind,
    required this.coordinates,
    required this.name,
    required this.date,
  });

  /// Factory method to create a WeatherData object from a JSON map
  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  /// Method to convert a WeatherData object to a JSON map
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
