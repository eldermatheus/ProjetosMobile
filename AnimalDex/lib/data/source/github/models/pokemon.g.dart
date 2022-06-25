// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubPokemonModel _$GithubPokemonModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['name', 'id', 'imageurl'],
      disallowNullValues: const ['name', 'id', 'imageurl']);
  return GithubPokemonModel(
    json['name'] as String,
    json['id'] as String,
    json['imageurl'] as String,
    json['xDescription'] as String? ?? '',
  );
}

Map<String, dynamic> _$GithubPokemonModelToJson(GithubPokemonModel instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'imageurl': instance.imageUrl,
      'xDescription': instance.xDescription,
    };
