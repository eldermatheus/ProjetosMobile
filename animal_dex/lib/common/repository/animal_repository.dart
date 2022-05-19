import 'dart:convert';

import 'package:animal_dex/common/Error/failure.dart';
import 'package:animal_dex/common/models/animal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../consts/ApiConsts.dart';

abstract class IAnimalRepositoy {
  Future<List<Animal>> getAllAnimal();
}

class AnimalRepositoy implements IAnimalRepositoy {
  final Dio dio;

  AnimalRepositoy({required this.dio});
  @override
  Future<List<Animal>> getAllAnimal() async {
    try {
      final response = await dio.get(ApiConsts.animalApiURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['animal'] as List<dynamic>;
      return list.map((e) => Animal.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Falha ao carregar');
    }
  }
}
