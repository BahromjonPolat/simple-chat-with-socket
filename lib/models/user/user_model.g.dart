// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel()
      .._username = fields[0] as String?
      .._email = fields[1] as String?
      .._password = fields[2] as String?
      .._isAvatarImageSet = fields[3] as bool?
      .._avatarImage = fields[4] as String?
      .._sId = fields[5] as String?
      .._iV = fields[6] as int?;
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj._username)
      ..writeByte(1)
      ..write(obj._email)
      ..writeByte(2)
      ..write(obj._password)
      ..writeByte(3)
      ..write(obj._isAvatarImageSet)
      ..writeByte(4)
      ..write(obj._avatarImage)
      ..writeByte(5)
      ..write(obj._sId)
      ..writeByte(6)
      ..write(obj._iV);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
