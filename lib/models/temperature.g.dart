// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map json) {
  return Temperature(
    temp: (json['temp'] as num)?.toDouble(),
    humidity: (json['humidity'] as num)?.toDouble(),
    pressure: (json['pressure'] as num)?.toDouble(),
    tempFeelsLike: (json['tempFeelsLike'] as num)?.toDouble(),
    tempMax: (json['tempMax'] as num)?.toDouble(),
    tempMin: (json['tempMin'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'tempFeelsLike': instance.tempFeelsLike,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
