import 'package:equatable/equatable.dart';

class Movie  extends Equatable{
  final bool? adult;
  final String? backdrop_path;
  final List<int>? genre_ids;
  final int id;
  final String? original_language;
  final String? original_title;
  final String? overview;
  final double? popularity;
  final DateTime? release_date;
  final String? title;
  final bool? video;
  final double? vote_average;
  final int? vote_count;
  const Movie({
    required this.adult,
    required this.backdrop_path,
    required this.genre_ids,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.release_date,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });
  
@override
  List<Object?> get props => [id];

}