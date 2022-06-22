import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/ui/widgets/pokemon_image.dart';

class PokemonCard extends StatelessWidget {
  static const double _pokemonFraction = 0.76;

  final Pokemon pokemon;
  final void Function()? onPress;

  const PokemonCard(
    this.pokemon, {
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
                    _buildPokemon(height: itemHeight), // Foto do animal
                    _buildPokemonNumber(),
                    _CardContent(pokemon), // Nome do animal
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPokemon({required double height}) {
    final pokemonSize = height * _pokemonFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: PokemonImage(
        size: Size.square(pokemonSize),
        pokemon: pokemon,
      ),
    );
  }

  Widget _buildPokemonNumber() {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        pokemon.number,
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
  final Pokemon pokemon;

  const _CardContent(this.pokemon, {Key? key}) : super(key: key);

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
              tag: pokemon.number + pokemon.name,
              child: Text(
                pokemon.name,
                style: TextStyle(
                  fontSize: 14,
                  height: 0.1,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ..._buildTypes(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTypes(BuildContext context) {
    return pokemon.types
        .take(2)
        .map(
          (type) => Padding(
            padding: EdgeInsets.only(bottom: 6),
//            child: PokemonType(type),
          ),
        )
        .toList();
  }
}
