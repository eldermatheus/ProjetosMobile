import 'package:animal_dex/common/repository/animal_repository.dart';
import 'package:animal_dex/features/animaldex/screens/details/container/detail_container.dart';
import 'package:animal_dex/features/animaldex/screens/home/container/home_container.dart';
import 'package:flutter/material.dart';

class AnimalDexRoute extends StatelessWidget {
  const AnimalDexRoute({Key? key, required this.repository}) : super(key: key);

  final AnimalRepositoy repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
            return HomeContainer(
              repositoy: repository,
              onItemTap: (route, arguments) {
                Navigator.of(context).pushNamed(route, arguments: arguments);
              },
            );
          });
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) {
            return DetailContainer(
              repositoy: repository,
              arguments: (settings.arguments as DetailArguments),
            );
          });
        }
      },
    );
  }
}
