import 'package:json_annotation/json_annotation.dart';

part 'animal.g.dart';

@JsonSerializable()
class GithubAnimalModel {
  GithubAnimalModel(
    this.id,
    this.scientificName,
    this.commonName,
    this.completeName,
    this.author,
    this.rankString,
    this.nameAuthority,
    this.kingdom,
    this.phylum,
    this.classe,
    this.order,
    this.suborder,
    this.family,
    this.genus,
    this.imageUrl,
    this.dataLink,
    this.imageAuthor,
    this.conservationState,
    this.geographicDistribution,
  );

  factory GithubAnimalModel.fromJson(Map<String, dynamic> json) =>
      _$GithubAnimalModelFromJson(json);

  Map<String, dynamic> toJson() => _$GithubAnimalModelToJson(this);

  @JsonKey(required: true, disallowNullValue: true)
  final String id;

  @JsonKey(required: true, disallowNullValue: true)
  final String scientificName;

  @JsonKey(required: true, disallowNullValue: true)
  final String commonName;

  @JsonKey(required: true, disallowNullValue: true)
  final String completeName;

  @JsonKey(required: true, disallowNullValue: true)
  final String author;

  @JsonKey(required: true, disallowNullValue: true)
  final String rankString;

  @JsonKey(required: true, disallowNullValue: true)
  final String nameAuthority;

  @JsonKey(required: true, disallowNullValue: true)
  final String kingdom;

  @JsonKey(required: true, disallowNullValue: true)
  final String phylum;

  @JsonKey(required: true, disallowNullValue: true)
  final String classe;

  @JsonKey(required: true, disallowNullValue: true)
  final String order;

  @JsonKey(required: true, disallowNullValue: true)
  final String suborder;

  @JsonKey(required: true, disallowNullValue: true)
  final String family;

  @JsonKey(required: true, disallowNullValue: true)
  final String genus;

  @JsonKey(required: true, disallowNullValue: true)
  final String imageUrl;

  @JsonKey(required: true, disallowNullValue: true)
  final String dataLink;

  @JsonKey(required: true, disallowNullValue: true)
  final String imageAuthor;

  @JsonKey(required: true, disallowNullValue: true)
  final String conservationState;

  @JsonKey(required: true, disallowNullValue: true)
  final String geographicDistribution;
}
