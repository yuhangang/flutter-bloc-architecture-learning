import 'package:bloc_architecture_learning/core/error/error.dart';
import 'package:bloc_architecture_learning/env/i_env.dart';
import 'package:bloc_architecture_learning/features/data/model/movie_model.dart';
import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:dio/dio.dart';


abstract class MovieDataSource {
  /// calls the api to get meals and drinks
  Future<List<Movie>>? getMovie();
  Future<List<Movie>>? searchMovie(String keyword);

}

class MovieDataSourceImpl
    implements MovieDataSource {
  late final Dio dio;
  late final IAppEnv env;
  MovieDataSourceImpl({required this.dio,required this.env});

  @override
  Future<List<Movie>> getMovie() async {
    final response = await dio.get(
        '${env.apibaseUrl}/movie/popular?api_key=${env.apiKey}');

    if (response.statusCode == 200) {
      return MovieResponseModel.fromJson(
              response.data)
          .movies;
    } else {
      throw ServerExceptions();
    }
  }
    @override
  Future<List<Movie>> searchMovie(String keyword) async {
    
    final response = await dio.get(
        '${env.apibaseUrl}/search/multi?api_key=${env.apiKey}&language=en-US&page=1&include_adult=true&query=$keyword');
 
    if (response.statusCode == 200) {
     
// log(response.data.toString());
      return MovieResponseModel.fromJson(
              response.data)
          .movies;
    } else {
            
      throw ServerExceptions();
    }
  }
  
  
}