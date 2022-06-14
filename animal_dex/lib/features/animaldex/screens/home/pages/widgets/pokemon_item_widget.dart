import 'package:flutter/material.dart';
import '../../../../../../common/models/animal.dart';

class AnimalItemWidget extends StatelessWidget {
  const AnimalItemWidget({Key? key, required this.animal}) : super(key: key);

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 132, 172, 232).withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(animal.name),
            Row(children: [
              Image.network(animal.image),
            ])
          ],
        ),
      ),
    );
  }
}
