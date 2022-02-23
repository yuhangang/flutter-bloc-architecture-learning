import 'package:bloc_architecture_learning/core/error/error.dart';
import 'package:bloc_architecture_learning/core/helper/network_helper/network_info_helper.dart';
import 'package:bloc_architecture_learning/features/data/data_sources/movie_datasource.dart';
import 'package:bloc_architecture_learning/features/data/data_sources/movie_local_datasource.dart';
import 'package:bloc_architecture_learning/features/data/repository/movie_repository.dart';
import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository{
 final MovieDataSource  movieDataSource;

 final NetworkInfoHelper networkInfo;
 MovieRepositoryImpl({required this.movieDataSource,required this.networkInfo});
 @override
  Future<Either<Exception, List<Movie>>>
      searchMovie(String keyword) async {
       
    if (await networkInfo.isConnected ?? false) {
    
      try {
            
        final remoteDrinks =
            await movieDataSource
                .searchMovie(keyword);
         
        if (remoteDrinks == null) {
        
          return Left(ServerExceptions());
        } else {

     
          return Right(remoteDrinks);
        }
      } on ServerExceptions {
      
        return Left(ServerExceptions());
      }
    } else {
      return Left(NetworkExceptions());
    }
      }
}