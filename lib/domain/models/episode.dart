
import 'package:json_annotation/json_annotation.dart';
import 'package:vix/domain/models/url.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {

  int id;
  String name;
  int number;
  Url urls;

  Episode({this.id, this.name, this.number, this.urls});

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

}