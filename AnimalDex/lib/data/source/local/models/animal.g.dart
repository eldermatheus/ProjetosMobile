// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:hive/hive.dart';

import 'animal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimalHiveModelAdapter extends TypeAdapter<AnimalHiveModel> {
  @override
  final int typeId = 0;

  @override
  AnimalHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimalHiveModel()
      ..id = fields[0] as String
      ..scientificName = fields[1] as String
      ..commonName = fields[2] as String
      ..completeName = fields[3] as String
      ..author = fields[4] as String
      ..rankString = fields[5] as String
      ..nameAuthority = fields[6] as String
      ..kingdom = fields[7] as String
      ..phylum = fields[8] as String
      ..classe = fields[9] as String
      ..order = fields[10] as String
      ..family = fields[11] as String
      ..genus = fields[12] as String
      ..imageAuthor = fields[13] as String
      ..name = fields[14] as String
      ..id2 = fields[15] as String
      ..imageUrl2 = fields[16] as String
      ..xdescription = fields[17] as String;
  }

  @override
  void write(BinaryWriter writer, AnimalHiveModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.scientificName)
      ..writeByte(2)
      ..write(obj.commonName)
      ..writeByte(3)
      ..write(obj.completeName)
      ..writeByte(4)
      ..write(obj.author)
      ..writeByte(5)
      ..write(obj.rankString)
      ..writeByte(6)
      ..write(obj.nameAuthority)
      ..writeByte(7)
      ..write(obj.kingdom)
      ..writeByte(8)
      ..write(obj.phylum)
      ..writeByte(9)
      ..write(obj.classe)
      ..writeByte(10)
      ..write(obj.order)
      ..writeByte(11)
      ..write(obj.family)
      ..writeByte(12)
      ..write(obj.genus)
      /*..writeByte()
      ..write(obj.imageUrl)
      ..writeByte()
      ..write(obj.dataLink)*/
      ..writeByte(13)
      ..write(obj.imageAuthor)
      ..writeByte(14)
      ..write(obj.name)
      ..writeByte(15)
      ..write(obj.id2)
      ..writeByte(16)
      ..write(obj.imageUrl2)
      ..writeByte(17)
      ..write(obj.xdescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalHiveModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
