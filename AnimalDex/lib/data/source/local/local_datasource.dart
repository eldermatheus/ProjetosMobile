import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/data/source/local/models/pokemon.dart';
import 'package:pokedex/data/source/local/models/pokemon.g.dart';

class LocalDataSource {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<PokemonHiveModel>(PokemonHiveModelAdapter());

    await Hive.openBox<PokemonHiveModel>(PokemonHiveModel.boxKey);
  }

  Future<bool> hasData() async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);

    return pokemonBox.length > 0;
  }

  Future<void> savePokemons(Iterable<PokemonHiveModel> pokemons) async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);

    final pokemonsMap = {for (var e in pokemons) e.number: e};

    await pokemonBox.clear();
    await pokemonBox.putAll(pokemonsMap);
  }

  Future<List<PokemonHiveModel>> getAllPokemons() async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);

    final pokemons = List.generate(pokemonBox.length, (index) => pokemonBox.getAt(index))
        .whereType<PokemonHiveModel>()
        .toList();

    return pokemons;
  }

  Future<List<PokemonHiveModel>> getPokemons({required int page, required int limit}) async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);
    final totalPokemons = pokemonBox.length;

    final start = (page - 1) * limit;
    final newPokemonCount = min(totalPokemons - start, limit);

    final pokemons = List.generate(newPokemonCount, (index) => pokemonBox.getAt(start + index))
        .whereType<PokemonHiveModel>()
        .toList();

    return pokemons;
  }

  Future<PokemonHiveModel?> getPokemon(String number) async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);

    return pokemonBox.get(number);
  }
}
