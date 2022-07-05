import 'package:animaldex/data/source/github/models/animal.dart';

import 'package:animaldex/data/source/local/models/animal.dart';

extension GithubAnimalModelToLocalX on GithubAnimalModel {
  AnimalHiveModel toHiveModel() => AnimalHiveModel()
    ..id = id.trim()
    ..scientificName = scientificName.trim()
    ..commonName = commonName.trim()
    ..completeName = completeName.trim()
    ..author = author.trim()
    ..rankString = rankString.trim()
    ..nameAuthority = nameAuthority.trim()
    ..kingdom = kingdom.trim()
    ..phylum = phylum.trim()
    ..classe = classe.trim()
    ..order = order.trim()
    ..family = family.trim()
    ..genus = genus.trim()
    /*..imageUrl =  .trim()
    ..dataLink =  .trim()*/
    ..imageAuthor = imageAuthor.trim()
    ..name = name.trim()
    ..id2 = id2.trim()
    ..imageUrl2 = imageUrl2.trim()
    ..xdescription = xdescription.trim();
}
