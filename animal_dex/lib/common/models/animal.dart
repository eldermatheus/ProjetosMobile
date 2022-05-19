import 'package:flutter/cupertino.dart';

class Animal {
  final String name;
  final String image;
  final List<String> type;
  final int id;
  final String num;

  factory Animal.fromMap(Map<String, dynamic> json) {
    return Animal(
      name: json['name'],
      image: json['img'],
      id: json['id'],
      num: json['num'],
      type: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
    );
  }

  Animal(
      {required this.type,
      required this.id,
      required this.num,
      required this.name,
      required this.image});
}
