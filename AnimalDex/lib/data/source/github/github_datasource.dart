import 'dart:convert';

import 'package:animaldex/core/network.dart';
import 'package:animaldex/data/source/github/models/animal.dart';

class GithubDataSource {
  GithubDataSource(this.networkManager);

  static const String url =
      'https://gist.githubusercontent.com/eldermatheus/936305adad56263d22d1d9d649562b22/raw/bfa2dc98194589e436736561b8550fcfd31c8135/animals.json';

  final NetworkManager networkManager;

  Future<List<GithubAnimalModel>> getAnimals() async {
    final response = await networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List)
        .map((item) => GithubAnimalModel.fromJson(item))
        .toList();

    return data;
  }
}
