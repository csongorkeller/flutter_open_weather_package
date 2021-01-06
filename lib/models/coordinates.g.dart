// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coordinates _$CoordinatesFromJson(Map json) {
  return Coordinates(
    lon: (json['lon'] as num)?.toDouble(),
    lat: (json['lat'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
