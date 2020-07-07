
import 'package:json_annotation/json_annotation.dart';
part 'resolution.g.dart';

@JsonSerializable()
class Resolution {

  String url;
  int resolution;

  Resolution({this.url, this.resolution});

  factory Resolution.fromJson(Map<String, dynamic> json) => _$ResolutionFromJson(json);

  Map<String, dynamic> toJson() => _$ResolutionToJson(this);

}