import 'package:pokedex/data/source/local/models/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

extension PokemonHiveModelX on PokemonHiveModel {
  Pokemon toEntity({List<PokemonHiveModel> evolutions = const []}) => Pokemon(
        name: name.trim(),
        number: id.trim(),
        image: imageUrl.trim(),
        xDescription: xDescription.trim(),
      );
}
