import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather_client/open_weather.dart';

part 'weather_forecast_data.g.dart';

@JsonSerializable()
class WeatherForecastData {
  /// Generic class to hold all values for weather forecasts coming from the API
  @JsonKey(name: 'list')
  List<WeatherData> forecastData;

  WeatherForecastData({required this.forecastData});

  factory WeatherForecastData.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastDataToJson(this);
}
