import 'package:json_annotation/json_annotation.dart';
import 'package:vix/domain/models/season.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  String name;
  int id;
  String year;
  String description;
  @JsonKey(name: "image_md") String mediumImage;
  @JsonKey(name: "season") List<Season> seasons;

  Movie({this.name, this.id, this.year, this.mediumImage, this.description, this.seasons});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

}
