// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likert_scale.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodAdapter extends TypeAdapter<LikertScale> {
  @override
  final int typeId = 1;

  @override
  LikertScale read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikertScale(
      scale: fields[0] as LikertScaleValue,
    );
  }

  @override
  void write(BinaryWriter writer, LikertScale obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.scale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MoodTypeAdapter extends TypeAdapter<LikertScaleValue> {
  @override
  final int typeId = 2;

  @override
  LikertScaleValue read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LikertScaleValue.stronglyDisagree;
      case 1:
        return LikertScaleValue.disagree;
      case 2:
        return LikertScaleValue.neutral;
      case 3:
        return LikertScaleValue.agree;
      case 4:
        return LikertScaleValue.stronglyAgree;
      default:
        return LikertScaleValue.stronglyDisagree;
    }
  }

  @override
  void write(BinaryWriter writer, LikertScaleValue obj) {
    switch (obj) {
      case LikertScaleValue.stronglyDisagree:
        writer.writeByte(0);
        break;
      case LikertScaleValue.disagree:
        writer.writeByte(1);
        break;
      case LikertScaleValue.neutral:
        writer.writeByte(2);
        break;
      case LikertScaleValue.agree:
        writer.writeByte(3);
        break;
      case LikertScaleValue.stronglyAgree:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
