// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_language.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppLanguageAdapter extends TypeAdapter<AppLanguage> {
  @override
  final int typeId = 1;

  @override
  AppLanguage read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AppLanguage.en;
      case 1:
        return AppLanguage.hu;
      default:
        return AppLanguage.en;
    }
  }

  @override
  void write(BinaryWriter writer, AppLanguage obj) {
    switch (obj) {
      case AppLanguage.en:
        writer.writeByte(0);
        break;
      case AppLanguage.hu:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppLanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
