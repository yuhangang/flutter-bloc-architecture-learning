import 'package:bloc_architecture_learning/core/helper/network_helper/network_info_helper.dart';
import 'package:bloc_architecture_learning/env/i_env.dart';
import 'package:bloc_architecture_learning/features/data/data_sources/movie_datasource.dart';
import 'package:bloc_architecture_learning/features/data/data_sources/movie_local_datasource.dart';
import 'package:bloc_architecture_learning/features/data/repository/movie_repository.dart';
import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';


@GenerateMocks([MovieRepository,NetworkInfoHelper,IAppEnv,Dio,Box],customMocks: [
    MockSpec<MovieLocalDataSource>(returnNullOnMissingStub: true),
    MockSpec<MovieDataSource>(returnNullOnMissingStub: true),
])

     final Movie movie = Movie(
      adult: true,
      backdrop_path: "",
      genre_ids: const [],
      id: 1,
      original_language: "en",
      original_title: "original title",
      overview: "overview",
      popularity: 7,
      release_date: DateTime(2020, 01, 01),
      title: "title",
      video: true,
      vote_average: 5.5,
      vote_count: 100);
void main(){}