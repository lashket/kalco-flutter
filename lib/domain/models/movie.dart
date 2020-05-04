import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  String name;
  int id;
  String year;
  @JsonKey(name: "image_md") String mediumImage;

  Movie({this.name, this.id, this.year, this.mediumImage});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

}
