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
      ..suborder = fields[11] as String
      ..family = fields[12] as String
      ..genus = fields[13] as String
      ..imageUrl = fields[14] as String
      ..dataLink = fields[15] as String
      ..imageAuthor = fields[16] as String
      ..conservationState = fields[17] as String
      ..geographicDistribution = fields[18] as String;
  }

  @override
  void write(BinaryWriter writer, AnimalHiveModel obj) {
    writer
      ..writeByte(19)
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
      ..write(obj.suborder)
      ..writeByte(12)
      ..write(obj.family)
      ..writeByte(13)
      ..write(obj.genus)
      ..writeByte(14)
      ..write(obj.imageUrl)
      ..writeByte(15)
      ..write(obj.dataLink)
      ..writeByte(16)
      ..write(obj.imageAuthor)
      ..writeByte(17)
      ..write(obj.conservationState)
      ..writeByte(18)
      ..write(obj.geographicDistribution);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalHiveModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
