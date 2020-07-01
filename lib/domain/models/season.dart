
import 'package:json_annotation/json_annotation.dart';
import 'package:vix/domain/models/episode.dart';
import 'package:vix/domain/models/movie.dart';

part 'season.g.dart';

@JsonSerializable()
class Season {

  int id;
  int number;
  @JsonKey(name: "episode") List<Episode> episodes;

  Season({this.id, this.number, this.episodes});

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);

}