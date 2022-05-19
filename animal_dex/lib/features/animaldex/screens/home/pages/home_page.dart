import 'package:animal_dex/features/animaldex/screens/details/container/detail_container.dart';
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
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].name),
            onTap: () =>
                onItemTap('/details', DetailArguments(name: list[index].name)),
          );
        },
      ),
    );
  }
}
