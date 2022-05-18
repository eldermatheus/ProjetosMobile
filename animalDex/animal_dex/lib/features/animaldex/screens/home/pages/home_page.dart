import 'package:flutter/material.dart';

import '../../../../../common/models/animal.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list}) : super(key: key);

  final List<Animal> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].name),
          );
        },
      ),
    );
  }
}
