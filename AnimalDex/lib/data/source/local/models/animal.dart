import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class AnimalHiveModel extends HiveObject {
  static const String boxKey = 'animal';

  @HiveField(0)
  late String id;

  @HiveField(1)
  late String scientificName;

  @HiveField(2)
  late String commonName;

  @HiveField(3)
  late String completeName;

  @HiveField(4)
  late String author;

  @HiveField(5)
  late String rankString;

  @HiveField(6)
  late String nameAuthority;

  @HiveField(7)
  late String kingdom;

  @HiveField(8)
  late String phylum;

  @HiveField(9)
  late String classe;

  @HiveField(10)
  late String order;

  @HiveField(11)
  late String suborder;

  @HiveField(12)
  late String family;

  @HiveField(13)
  late String genus;

  @HiveField(14)
  late String imageUrl;

  @HiveField(15)
  late String dataLink;

  @HiveField(16)
  late String imageAuthor;

  @HiveField(17)
  late String conservationState;

  @HiveField(18)
  late String geographicDistribution;
}
