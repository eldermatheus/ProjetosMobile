// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubAnimalModel _$GithubAnimalModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'id',
    'scientificName',
    'commonName',
    'completeName',
    'author',
    'rankString',
    'nameAuthority',
    'kingdom',
    'phylum',
    'classe',
    'order',
    'suborder',
    'family',
    'genus',
    'imageUrl',
    'dataLink',
    'imageAuthor',
    'conservationState',
    'geographicDistribution',
  ], disallowNullValues: const [
    'id',
    'scientificName',
    'commonName',
    'completeName',
    'author',
    'rankString',
    'nameAuthority',
    'kingdom',
    'phylum',
    'classe',
    'order',
    'suborder',
    'family',
    'genus',
    'imageUrl',
    'dataLink',
    'imageAuthor',
    'conservationState',
    'geographicDistribution',
  ]);
  return GithubAnimalModel(
    json['id'] as String,
    json['scientificName'] as String,
    json['commonName'] as String,
    json['completeName'] as String,
    json['author'] as String,
    json['rankString'] as String,
    json['nameAuthority'] as String,
    json['kingdom'] as String,
    json['phylum'] as String,
    json['classe'] as String,
    json['order'] as String,
    json['suborder'] as String,
    json['family'] as String,
    json['genus'] as String,
    json['imageUrl'] as String,
    json['dataLink'] as String,
    json['imageAuthor'] as String,
    json['conservationState'] as String,
    json['geographicDistribution'] as String,
  );
}

Map<String, dynamic> _$GithubAnimalModelToJson(GithubAnimalModel instance) => <String, dynamic>{
      'id': instance.id,
      'scientificName': instance.scientificName,
      'commonName': instance.commonName,
      'completeName': instance.completeName,
      'author': instance.author,
      'rankString': instance.rankString,
      'nameAuthority': instance.nameAuthority,
      'kingdom': instance.kingdom,
      'phylum': instance.phylum,
      'classe': instance.classe,
      'order': instance.order,
      'suborder': instance.suborder,
      'family': instance.family,
      'genus': instance.genus,
      'imageUrl': instance.imageUrl,
      'dataLink': instance.dataLink,
      'imageAuthor': instance.imageAuthor,
      'conservationState': instance.conservationState,
      'geographicDistribution': instance.geographicDistribution,
    };
