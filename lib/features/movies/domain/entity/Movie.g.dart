// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 0;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      id: fields[0] as int,
      title: fields[1] as String?,
      overview: fields[2] as String?,
      posterPath: fields[3] as String?,
      popularity: fields[4] as double?,
      voteCount: fields[5] as int?,
      originalLanguage: fields[6] as String?,
      voteAverage: fields[7] as double?,
      releaseDate: fields[8] as String?,
      genreIds: (fields[9] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.popularity)
      ..writeByte(5)
      ..write(obj.voteCount)
      ..writeByte(6)
      ..write(obj.originalLanguage)
      ..writeByte(7)
      ..write(obj.voteAverage)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.genreIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteCount: (json['voteCount'] as num?)?.toInt(),
      originalLanguage: json['originalLanguage'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      releaseDate: json['releaseDate'] as String?,
      genreIds: (json['genreIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'popularity': instance.popularity,
      'voteCount': instance.voteCount,
      'originalLanguage': instance.originalLanguage,
      'voteAverage': instance.voteAverage,
      'releaseDate': instance.releaseDate,
      'genreIds': instance.genreIds,
    };
