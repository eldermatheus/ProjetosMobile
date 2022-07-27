import 'dart:math';

import 'package:animaldex/data/source/local/models/animal.dart';
import 'package:animaldex/data/source/local/models/animal.g.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<AnimalHiveModel>(AnimalHiveModelAdapter());

    await Hive.openBox<AnimalHiveModel>(AnimalHiveModel.boxKey);
  }

  Future<bool> hasData() async {
    final animalBox = Hive.box<AnimalHiveModel>(AnimalHiveModel.boxKey);

    return animalBox.length > 0;
  }

  Future<void> saveAnimals(Iterable<AnimalHiveModel> animals) async {
    final animalBox = Hive.box<AnimalHiveModel>(AnimalHiveModel.boxKey);

    final animalsMap = {for (var e in animals) e.id: e};

    await animalBox.clear();
    await animalBox.putAll(animalsMap);
  }

  Future<List<AnimalHiveModel>> getAllAnimals() async {
    final animalBox = Hive.box<AnimalHiveModel>(AnimalHiveModel.boxKey);

    final animals = List.generate(animalBox.length, (index) => animalBox.getAt(index))
        .whereType<AnimalHiveModel>()
        .toList();

    return animals;
  }

  Future<List<AnimalHiveModel>> getAnimals({required int page, required int limit}) async {
    final animalBox = Hive.box<AnimalHiveModel>(AnimalHiveModel.boxKey);
    final totalAnimals = animalBox.length;

    final start = (page - 1) * limit;
    final newAnimalCount = min(totalAnimals - start, limit);

    final animals = List.generate(newAnimalCount, (index) => animalBox.getAt(start + index))
        .whereType<AnimalHiveModel>()
        .toList();

    return animals;
  }

  Future<AnimalHiveModel?> getAnimal(String id) async {
    final animalBox = Hive.box<AnimalHiveModel>(AnimalHiveModel.boxKey);

    return animalBox.get(id);
  }
}
