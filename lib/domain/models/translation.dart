import 'package:json_annotation/json_annotation.dart';
import 'package:vix/domain/models/resolution.dart';

part 'translation.g.dart';

@JsonSerializable()
class Translation {

  List<Resolution> resolutions;
  String translate;

  Translation({this.resolutions, this.translate});

  factory Translation.fromJson(Map<String, dynamic> json) => _$TranslationFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationToJson(this);

}