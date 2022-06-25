import 'package:flutter/material.dart';

class Pokemon {
  const Pokemon({
    required this.number,
    required this.name,
    required this.xDescription,
    required this.image,
  });

  final String number;
  final String name;
  final String xDescription;
  final String image;
}
