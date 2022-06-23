import 'package:pokedex/data/source/local/models/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

extension PokemonHiveModelX on PokemonHiveModel {
  Pokemon toEntity({List<PokemonHiveModel> evolutions = const []}) => Pokemon(
        number: number.trim(),
        name: name.trim(),
        description: description.trim(),
        image: image.trim(),
        height: height.trim(),
        weight: weight.trim(),
        genera: genera.trim(),
        eggGroups: eggGroups.map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
        baseExp: baseExp,
        evolutions: evolutions.map((e) => e.toEntity()).toList(),
        evolutionReason: evolutionReason,
      );
}
