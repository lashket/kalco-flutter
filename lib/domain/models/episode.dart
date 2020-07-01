
import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {

  int id;
  String name;
  int number;

  Episode({this.id, this.name, this.number});

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

}