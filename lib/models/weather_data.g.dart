// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map json) {
  return WeatherData(
    details: (json['weather'] as List)
        ?.map((e) => e == null
            ? null
            : Details.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    temperature: json['main'] == null
        ? null
        : Temperature.fromJson((json['main'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    wind: json['wind'] == null
        ? null
        : Wind.fromJson((json['wind'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    coordinates: json['coord'] == null
        ? null
        : Coordinates.fromJson((json['coord'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    name: json['name'] as String,
  )..date = json['dt'] as int;
}

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'weather': instance.details?.map((e) => e?.toJson())?.toList(),
      'wind': instance.wind?.toJson(),
      'main': instance.temperature?.toJson(),
      'coord': instance.coordinates?.toJson(),
      'name': instance.name,
      'dt': instance.date,
    };
