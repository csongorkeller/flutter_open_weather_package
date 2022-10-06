// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastData _$WeatherForecastDataFromJson(Map json) =>
    WeatherForecastData(
      forecastData: (json['list'] as List<dynamic>)
          .map((e) => WeatherData.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$WeatherForecastDataToJson(
        WeatherForecastData instance) =>
    <String, dynamic>{
      'list': instance.forecastData.map((e) => e.toJson()).toList(),
    };
