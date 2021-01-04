// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map json) {
  return WeatherData(
    weather: (json['weather'] as List)
        ?.map((e) => e == null
            ? null
            : Weather.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    main: json['main'] == null
        ? null
        : Main.fromJson((json['main'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    wind: json['wind'] == null
        ? null
        : Wind.fromJson((json['wind'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'weather': instance.weather?.map((e) => e?.toJson())?.toList(),
      'wind': instance.wind?.toJson(),
      'main': instance.main?.toJson(),
    };
