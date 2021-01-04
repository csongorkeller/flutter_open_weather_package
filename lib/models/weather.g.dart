// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map json) {
  return Weather(
    weatherStatus: json['weatherStatus'] as String,
    weatherDescription: json['weatherDescription'] as String,
    temperature: json['temperature'] == null
        ? null
        : Temperature.fromJson((json['temperature'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    weatherIcon: json['weatherIcon'] as String,
    wind: json['wind'] == null
        ? null
        : Wind.fromJson((json['wind'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'weatherStatus': instance.weatherStatus,
      'weatherDescription': instance.weatherDescription,
      'weatherIcon': instance.weatherIcon,
      'temperature': instance.temperature?.toJson(),
      'wind': instance.wind?.toJson(),
    };
