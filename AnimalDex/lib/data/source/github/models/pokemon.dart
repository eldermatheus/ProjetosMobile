import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class GithubPokemonModel {
  GithubPokemonModel(
    this.name,
    this.id,
    this.imageUrl,
    this.xDescription,
  );

  factory GithubPokemonModel.fromJson(Map<String, dynamic> json) =>
      _$GithubPokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$GithubPokemonModelToJson(this);

  @JsonKey(required: true, disallowNullValue: true)
  final String name;

  @JsonKey(required: true, disallowNullValue: true)
  final String id;

  @JsonKey(required: true, name: 'imageurl', disallowNullValue: true)
  final String imageUrl;

  @JsonKey(name: 'xDescription', defaultValue: '')
  final String xDescription;
}
