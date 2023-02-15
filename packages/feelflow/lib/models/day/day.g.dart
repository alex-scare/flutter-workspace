// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayAdapter extends TypeAdapter<Day> {
  @override
  final int typeId = 0;

  @override
  Day read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Day(
      date: fields[1] as DateTime,
      scale: fields[2] as LikertScale,
    )..key = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Day obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.scale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
