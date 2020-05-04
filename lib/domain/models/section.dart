
import 'package:json_annotation/json_annotation.dart';
import 'package:kalco_flutter/domain/models/category.dart';
import 'package:kalco_flutter/domain/models/movie.dart';
import 'package:kalco_flutter/domain/models/tag.dart';
part 'section.g.dart';

@JsonSerializable()
class Section {

  Section({this.category, this.name, this.tag, this.movies});

  String name;

  Tag tag;

  @JsonKey(name: "genre")
  Category category;

  @JsonKey(name: "video")
  List<Movie> movies;

  String get sectionName {
    if(tag != null) {
      return tag.name;
    } else {
      return category.name;
    }
  }

  factory Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);

  Map<String, dynamic> toJson() => _$SectionToJson(this);

}

List<Section> sections = <Section>[
  Section(name: 'First section'),
  Section(name: 'First section'),
  Section(name: 'First section'),
];