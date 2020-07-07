// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resolution _$ResolutionFromJson(Map<String, dynamic> json) {
  return Resolution(
    url: json['url'] as String,
    resolution: json['resolution'] as int,
  );
}

Map<String, dynamic> _$ResolutionToJson(Resolution instance) =>
    <String, dynamic>{
      'url': instance.url,
      'resolution': instance.resolution,
    };
