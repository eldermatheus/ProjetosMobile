import 'package:pokedex/data/source/github/models/pokemon.dart';

import 'package:pokedex/data/source/local/models/pokemon.dart';

extension GithubPokemonModelToLocalX on GithubPokemonModel {
  PokemonHiveModel toHiveModel() => PokemonHiveModel()
    ..number = id.trim()
    ..name = name.trim()
    ..imageUrl = imageUrl.trim()
    ..xDescription = xDescription.trim();
}
