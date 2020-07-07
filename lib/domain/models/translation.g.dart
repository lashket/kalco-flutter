// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Translation _$TranslationFromJson(Map<String, dynamic> json) {
  return Translation(
    resolutions: (json['resolutions'] as List)
        ?.map((e) =>
            e == null ? null : Resolution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    translate: json['translate'] as String,
  );
}

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'resolutions': instance.resolutions,
      'translate': instance.translate,
    };
