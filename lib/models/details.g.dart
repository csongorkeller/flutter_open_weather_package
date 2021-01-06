// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Details _$DetailsFromJson(Map json) {
  return Details(
    id: json['id'] as int,
    weatherShortDescription: json['main'] as String,
    weatherLongDescription: json['description'] as String,
    icon: json['icon'] as String,
  );
}

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.weatherShortDescription,
      'description': instance.weatherLongDescription,
      'icon': instance.icon,
    };
