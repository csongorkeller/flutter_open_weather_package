// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastData _$WeatherForecastDataFromJson(Map json) {
  return WeatherForecastData(
    forecastData: (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : WeatherData.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$WeatherForecastDataToJson(
        WeatherForecastData instance) =>
    <String, dynamic>{
      'list': instance.forecastData?.map((e) => e?.toJson())?.toList(),
    };
