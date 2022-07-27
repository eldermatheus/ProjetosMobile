import 'package:animaldex/core/network.dart';
import 'package:animaldex/data/repositories/animal_repository.dart';
import 'package:animaldex/data/source/github/github_datasource.dart';
import 'package:animaldex/data/source/local/local_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await LocalDataSource.initialize();

  final networkManager = NetworkManager();
  final githubDataSource = GithubDataSource(networkManager);
  final repository = AnimalDefaultRepository(
    githubDataSource: githubDataSource,
    localDataSource: LocalDataSource(),
  );

  test('Verifica se a lista é vazia', () async {
    final list = await repository.getAllAnimals();
    expect(list.isNotEmpty, equals(true));
  });

  test('Verifica se o nome científico não é nulo', () async {
    final list = await repository.getAllAnimals();
    expect(list.first.scientificName, equals(isNotNull));
  });

  test('Verifica o retorno de um animal por id', () async {
    final animal = await repository.getAnimal('114353');
    expect(animal, equals(isNotNull));
  });

  test('Verifica se o arquivo json local é nulo', () {
    final jsonLocalDataSource = repository.localDataSource;
    expect(jsonLocalDataSource, equals(isNotNull));
  });

  test('Verifica se o arquivo json do GitHub é nulo', () {
    final jsonRemoteDataSource = repository.githubDataSource;
    expect(jsonRemoteDataSource, equals(isNotNull));
  });
}
