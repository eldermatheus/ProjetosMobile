import 'package:animal_dex/common/Error/failure.dart';
import 'package:animal_dex/common/repository/animal_repository.dart';
import 'package:animal_dex/features/animaldex/screens/details/container/detail_container.dart';
import 'package:animal_dex/features/animaldex/screens/home/pages/home_error.dart';
import 'package:animal_dex/features/animaldex/screens/home/pages/home_page.dart';

import 'package:flutter/cupertino.dart';

import '../../../../../common/models/animal.dart';
import '../pages/home_loading.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repositoy,
    required this.onItemTap,
  }) : super(key: key);

  final IAnimalRepositoy repositoy;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Animal>>(
        future: repositoy.getAllAnimal(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return HomeLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(
              list: snapshot.data!,
              onItemTap: onItemTap,
            );
          }

          if (snapshot.hasError) {
            return HomeError(error: (snapshot.error as Failure).message!);
          }
          return Container();
        });
  }
}
