import 'package:pokedex/data/source/local/models/pokemon.dart';
import 'package:pokedex/data/source/local/models/pokemon_stats.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_props.dart';

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
        stats: stats.toEntity(),
        baseExp: baseExp,
        evolutions: evolutions.map((e) => e.toEntity()).toList(),
        evolutionReason: evolutionReason,
      );
}

extension PokemonStatsHiveModelX on PokemonStatsHiveModel {
  PokemonStats toEntity() => PokemonStats(
        attack: attack,
        specialAttack: specialAttack,
        defense: defense,
        specialDefense: specialDefense,
        hp: hp,
        speed: speed,
      );
}
