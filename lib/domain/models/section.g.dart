// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) {
  return Section(
    category: json['genre'] == null
        ? null
        : Category.fromJson(json['genre'] as Map<String, dynamic>),
    name: json['name'] as String,
    tag: json['tag'] == null
        ? null
        : Tag.fromJson(json['tag'] as Map<String, dynamic>),
    movies: (json['video'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'name': instance.name,
      'tag': instance.tag,
      'genre': instance.category,
      'video': instance.movies,
    };
