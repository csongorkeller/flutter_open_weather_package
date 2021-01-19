import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather/open_weather.dart';

part 'weather_forecast_data.g.dart';

@JsonSerializable()

/// Generic class to hold all values for weather forecasts coming from the API
class WeatherForecastData {
  @JsonKey(name: 'list')
  List<WeatherData> forecastData;

  WeatherForecastData({this.forecastData});

  factory WeatherForecastData.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastDataToJson(this);
}
