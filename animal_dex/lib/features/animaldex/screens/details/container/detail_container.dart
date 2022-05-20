import 'package:animal_dex/common/Error/failure.dart';
import 'package:animal_dex/common/models/animal.dart';
import 'package:animal_dex/common/repository/animal_repository.dart';
import 'package:animal_dex/common/widget/an_error.dart';
import 'package:animal_dex/common/widget/an_loading.dart';
import 'package:animal_dex/features/animaldex/screens/details/pages/detail_page.dart';
import 'package:flutter/material.dart';

class DetailArguments {
  DetailArguments({required this.name});
  final String name;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {Key? key, required this.repositoy, required this.arguments})
      : super(key: key);
  final IAnimalRepositoy repositoy;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Animal>>(
        future: repositoy.getAllAnimal(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AnLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailPage(name: arguments.name, list: snapshot.data!);
          }

          if (snapshot.hasError) {
            return AnError(error: (snapshot.error as Failure).message!);
          }
          return Container();
        });
  }
}
