// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    name: json['name'] as String,
    id: json['id'] as int,
    year: json['year'] as String,
    mediumImage: json['image_md'] as String,
    description: json['description'] as String,
    seasons: (json['season'] as List)
        ?.map((e) =>
            e == null ? null : Season.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'year': instance.year,
      'description': instance.description,
      'image_md': instance.mediumImage,
      'season': instance.seasons,
    };
