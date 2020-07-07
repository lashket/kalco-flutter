// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return Episode(
    id: json['id'] as int,
    name: json['name'] as String,
    number: json['number'] as int,
    urls: json['urls'] == null
        ? null
        : Url.fromJson(json['urls'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'urls': instance.urls,
    };
