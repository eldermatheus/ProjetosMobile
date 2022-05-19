import 'package:animal_dex/common/repository/animal_repository.dart';
import 'package:animal_dex/features/animaldex/screens/home/container/home_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Dex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeContainer(
        repositoy: AnimalRepositoy(dio: Dio()),
      ),
    );
  }
}
