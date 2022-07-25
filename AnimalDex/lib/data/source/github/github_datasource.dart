import 'dart:convert';

import 'package:animaldex/core/network.dart';
import 'package:animaldex/data/source/github/models/animal.dart';

class GithubDataSource {
  GithubDataSource(this.networkManager);

  static const String url =
      'https://gist.githubusercontent.com/eldermatheus/7d04520ab17838018591d481101987e6/raw/5d0e70c0684f89ca569cec50ff315fa59914a4cd/animals.json';

  final NetworkManager networkManager;

  Future<List<GithubAnimalModel>> getAnimals() async {
    final response = await networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List)
        .map((item) => GithubAnimalModel.fromJson(item))
        .toList();

    return data;
  }
}
