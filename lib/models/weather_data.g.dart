// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map json) => WeatherData(
      details: (json['weather'] as List<dynamic>)
          .map((e) => Details.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      temperature:
          Temperature.fromJson(Map<String, dynamic>.from(json['main'] as Map)),
      wind: Wind.fromJson(Map<String, dynamic>.from(json['wind'] as Map)),
      coordinates: json['coord'] == null
          ? null
          : Coordinates.fromJson(
              Map<String, dynamic>.from(json['coord'] as Map)),
      name: json['name'] as String,
      date: json['dt'] as int,
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'weather': instance.details.map((e) => e.toJson()).toList(),
      'wind': instance.wind.toJson(),
      'main': instance.temperature.toJson(),
      'coord': instance.coordinates?.toJson(),
      'name': instance.name,
      'dt': instance.date,
    };
