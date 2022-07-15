import 'package:animaldex/data/source/local/models/animal.dart';
import 'package:animaldex/domain/entities/animal.dart';

extension AnimalHiveModelX on AnimalHiveModel {
  Animal toEntity({List<AnimalHiveModel> evolutions = const []}) => Animal(
        id: id.trim(),
        scientificName: scientificName.trim(),
        commonName: commonName.trim(),
        completeName: completeName.trim(),
        author: author.trim(),
        rankString: rankString.trim(),
        nameAuthority: nameAuthority.trim(),
        kingdom: kingdom.trim(),
        phylum: phylum.trim(),
        classe: classe.trim(),
        order: order.trim(),
        family: family.trim(),
        genus: genus.trim(),
        /*--imageUrl
        --dataLink*/
        imageAuthor: imageAuthor.trim(),
        name: name.trim(),
        id2: id2.trim(),
        imageUrl2: imageUrl2.trim(),
        xdescription: xdescription.trim(),
      );
}
