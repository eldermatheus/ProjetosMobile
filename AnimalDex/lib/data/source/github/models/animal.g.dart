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
    'family',
    'genus',
    'imageAuthor',
    'name',
    'imageUrl2',
    'id2',
    'xdescription',
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
    'family',
    'genus',
    'imageAuthor',
    'name',
    'imageUrl2',
    'id2',
    'xdescription',
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
    json['family'] as String,
    json['genus'] as String,
    json['imageAuthor'] as String,
    json['name'] as String,
    json['id2'] as String,
    json['imageUrl2'] as String,
    json['xdescription'] as String,
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
      'family': instance.family,
      'genus': instance.genus,
      'imageAuthor': instance.imageAuthor,
      'name': instance.name,
      'id2': instance.id2,
      'imageUrl2': instance.imageUrl2,
      'xdescription': instance.xdescription,
    };
