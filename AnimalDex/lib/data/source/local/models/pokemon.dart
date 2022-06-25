import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class PokemonHiveModel extends HiveObject {
  static const String boxKey = 'animal';

  @HiveField(0)
  late String name;

  @HiveField(1)
  late String number;

  @HiveField(2)
  late String imageUrl;

  @HiveField(3)
  late String xDescription;
}
