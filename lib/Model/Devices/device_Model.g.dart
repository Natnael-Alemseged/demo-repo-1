// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class deviceModelAdapter extends TypeAdapter<device_Model> {
  @override
  final int typeId = 0;

  @override
  device_Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return device_Model()
      ..deviceID = fields[0] as String
      ..modelName = fields[1] as String
      ..platformVersion = fields[2] as String
      ..deviceName = fields[3] as String
      ..hardware = fields[4] as String
      ..manufacturerName = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, device_Model obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.deviceID)
      ..writeByte(1)
      ..write(obj.modelName)
      ..writeByte(2)
      ..write(obj.platformVersion)
      ..writeByte(3)
      ..write(obj.deviceName)
      ..writeByte(4)
      ..write(obj.hardware)
      ..writeByte(5)
      ..write(obj.manufacturerName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is deviceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
