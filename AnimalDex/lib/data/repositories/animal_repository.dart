import 'package:animaldex/data/source/github/github_datasource.dart';
import 'package:animaldex/data/source/local/local_datasource.dart';
import 'package:animaldex/data/source/mappers/github_to_local_mapper.dart';
import 'package:animaldex/data/source/mappers/local_to_entity_mapper.dart';
import 'package:animaldex/domain/entities/animal.dart';

abstract class AnimalRepository {
  Future<List<Animal>> getAllAnimals();

  Future<List<Animal>> getAnimals({required int limit, required int page});

  Future<Animal?> getAnimal(String number);
}

class AnimalDefaultRepository extends AnimalRepository {
  AnimalDefaultRepository({required this.githubDataSource, required this.localDataSource});

  final GithubDataSource githubDataSource;
  final LocalDataSource localDataSource;

  @override
  Future<List<Animal>> getAllAnimals() async {
    final hasCachedData = await localDataSource.hasData();

    if (!hasCachedData) {
      final animalGithubModels = await githubDataSource.getAnimals();
      final animalHiveModels = animalGithubModels.map((e) => e.toHiveModel());

      await localDataSource.saveAnimals(animalHiveModels);
    }

    final animalHiveModels = await localDataSource.getAllAnimals();

    final animalEntities = animalHiveModels.map((e) => e.toEntity()).toList();

    return animalEntities;
  }

  @override
  Future<List<Animal>> getAnimals({required int limit, required int page}) async {
    final hasCachedData = await localDataSource.hasData();

    if (!hasCachedData) {
      final animalGithubModels = await githubDataSource.getAnimals();
      final animalHiveModels = animalGithubModels.map((e) => e.toHiveModel());

      await localDataSource.saveAnimals(animalHiveModels);
    }

    final animalHiveModels = await localDataSource.getAnimals(
      page: page,
      limit: limit,
    );
    final animalEntities = animalHiveModels.map((e) => e.toEntity()).toList();

    return animalEntities;
  }

  @override
  Future<Animal?> getAnimal(String number) async {
    final animalModel = await localDataSource.getAnimal(number);

    if (animalModel == null) return null;

    final animal = animalModel.toEntity();

    return animal;
  }
}
