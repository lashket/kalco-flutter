
import 'package:json_annotation/json_annotation.dart';
import 'package:vix/domain/models/translation.dart';

part 'url.g.dart';

@JsonSerializable()
class Url {

  List<Translation> translations;

  Url({this.translations});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);

}