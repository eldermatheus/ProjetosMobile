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
    ..suborder = suborder.trim()
    ..family = family.trim()
    ..genus = genus.trim()
    ..imageUrl = imageUrl.trim()
    ..dataLink = dataLink.trim()
    ..imageAuthor = imageAuthor.trim()
    ..conservationState = conservationState.trim()
    ..geographicDistribution = geographicDistribution.trim();
}
