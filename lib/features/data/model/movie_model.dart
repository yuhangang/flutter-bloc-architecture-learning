

import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:hive/hive.dart';
part 'movie_model.g.dart';

/*
type adapter for movie
  return MovieModel(adult: fields[0],backdrop_path: fields[1], genre_ids: fields[2],id: fields[3],original_language: fields[4],original_title: fields[5],overview: fields[6],popularity: fields[7],release_date: fields[8],title: fields[9],video: fields[10],vote_average: fields[11],vote_count: fields[12]);

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
      ..writeByte(12)..write(obj.vote_count)
      ;
*/
class MovieResponseModel {
  List<Movie> movies;

  MovieResponseModel({required this.movies});

  factory MovieResponseModel.fromJson(
      Map<String, dynamic> json) {
       
    return MovieResponseModel(        movies: json['results'] != null
            ? List<Movie>.from(
                (json['results'] as List<dynamic>)
                    .map((e) =>
                        MovieModel.fromJson(e)))
            : []);
  }
}

@HiveType(typeId: 1)
class MovieModel extends Movie{
 
  const MovieModel({
    @HiveField(0) required bool? adult,
    @HiveField(1) required String? backdrop_path,
    @HiveField(2) required List<int>? genre_ids,
    @HiveField(3) required int id,
    @HiveField(4) required String? original_language,
    @HiveField(5) required String? original_title,
    @HiveField(6)required String? overview,
    @HiveField(7) required double? popularity,
    @HiveField(8) required DateTime? release_date,
    @HiveField(9) required String? title,
    @HiveField(10) required bool? video,
    @HiveField(11) required double? vote_average,
    @HiveField(12) required int? vote_count,
  }):super(adult: adult,backdrop_path: backdrop_path,genre_ids: genre_ids,id: id,original_language: original_language,original_title: original_title,overview: overview,popularity: popularity,release_date: release_date,title: title,video: video,vote_average: vote_average,vote_count: vote_count);

 factory MovieModel.fromJson(Map<String, dynamic> map) {
 
    return MovieModel(
      adult: map['adult'],
      backdrop_path: map['backdrop_path']??map["poster_path"],
      genre_ids: List<int>.from(map['genre_ids'] ??[]),
      id: map['id'],
      original_language: map['original_language'],
      original_title: map['original_title']??map['original_name'],
      overview: map['overview'],
      popularity: map['popularity'],
      release_date:DateTime.tryParse(map['release_date']??""),
      title: map['title']??map["name"],
      video: map['video'],
      vote_average: map['vote_average'].runtimeType == double
          ? map['vote_average']
          : double.tryParse(map['vote_average'].toString()),
      vote_count: map['vote_count'],
    );
  }
}