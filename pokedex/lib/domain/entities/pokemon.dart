import 'package:flutter/material.dart';

import 'pokemon_props.dart';

class Pokemon {
  const Pokemon({
    required this.number,
    required this.name,
    required this.description,
    required this.image,
    required this.height,
    required this.weight,
    required this.genera,
    required this.eggGroups,
    required this.stats,
    required this.baseExp,
    required this.evolutions,
    required this.evolutionReason,
  });

  final String number;
  final String name;
  final String description;
  final String image;
  final String height;
  final String weight;
  final String genera;
  final List<String> eggGroups;
  final PokemonStats stats;
  final double baseExp;
  final List<Pokemon> evolutions;
  final String evolutionReason;
}
