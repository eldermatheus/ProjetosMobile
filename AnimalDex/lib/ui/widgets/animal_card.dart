import 'package:flutter/material.dart';
import 'package:animaldex/domain/entities/animal.dart';
import 'package:animaldex/ui/widgets/animal_image.dart';

class AnimalCard extends StatelessWidget {
  static const double _animalFraction = 0.76;

  final Animal animal;
  final void Function()? onPress;

  const AnimalCard(
    this.animal, {
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return Container(
          decoration: BoxDecoration(
            //color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.lightBlueAccent.withOpacity(0.4),
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: Colors.lightBlue, // Cor do card
              child: InkWell(
                onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildAnimal(height: itemHeight), // Foto do animal
                    _buildAnimalNumber(), // Numero do animal
                    _CardContent(animal), // Nome do animal
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimal({required double height}) {
    final animalSize = height * _animalFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: AnimalImage(
        size: Size.square(animalSize),
        animal: animal,
      ),
    );
  }

  Widget _buildAnimalNumber() {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        animal.id,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final Animal animal;

  const _CardContent(this.animal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
              tag: animal.id + animal.name,
              child: Text(
                animal.name,
                style: TextStyle(
                  fontSize: 14,
                  height: 0.1,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
