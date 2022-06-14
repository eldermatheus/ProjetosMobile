import 'package:animal_dex/features/animaldex/screens/details/container/detail_container.dart';
import 'package:animal_dex/features/animaldex/screens/home/pages/widgets/pokemon_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../common/models/animal.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.list,
    required this.onItemTap,
  }) : super(key: key);

  final List<Animal> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        children: list.map((e) => AnimalItemWidget(animal: e)).toList(),
      ),
    );
  }
}
