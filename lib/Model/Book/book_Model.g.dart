// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class bookModelAdapter extends TypeAdapter<book_Model> {
  @override
  final int typeId = 2;

  @override
  book_Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return book_Model()
      ..bookName = fields[0] as String?
      ..bookPassword = fields[1] as String?
      ..bookImagePath = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, book_Model obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bookName)
      ..writeByte(1)
      ..write(obj.bookPassword)
      ..writeByte(2)
      ..write(obj.bookImagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is bookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
