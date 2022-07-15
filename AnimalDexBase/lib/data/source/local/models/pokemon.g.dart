// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:hive/hive.dart';

import 'pokemon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonHiveModelAdapter extends TypeAdapter<PokemonHiveModel> {
  @override
  final int typeId = 0;

  @override
  PokemonHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonHiveModel()
      ..name = fields[0] as String
      ..id = fields[1] as String
      ..imageUrl = fields[2] as String
      ..xDescription = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, PokemonHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.xDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
