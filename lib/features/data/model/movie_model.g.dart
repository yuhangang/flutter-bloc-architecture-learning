// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelAdapter extends TypeAdapter<MovieModel> {
  @override
  final int typeId = 1;

  @override
  MovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieModel(adult: fields[0],backdrop_path: fields[1], genre_ids: fields[2],id: fields[3],original_language: fields[4],original_title: fields[5],overview: fields[6],popularity: fields[7],release_date: fields[8],title: fields[9],video: fields[10],vote_average: fields[11],vote_count: fields[12]);
  }

  @override
  void write(BinaryWriter writer, MovieModel obj) {
  writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdrop_path)
      ..writeByte(2)
      ..write(obj.genre_ids)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.original_language)
      ..writeByte(5)..write(obj.original_title)
      ..writeByte(6)..write(obj.overview)
      ..writeByte(7)..write(obj.popularity)
      ..writeByte(8)..write(obj.release_date)
      ..writeByte(9)..write(obj.title)
      ..writeByte(10)..write(obj.video)
      ..writeByte(11)..write(obj.vote_average)
      ..writeByte(12)..write(obj.vote_count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
