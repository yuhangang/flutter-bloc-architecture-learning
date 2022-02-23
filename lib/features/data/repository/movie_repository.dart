import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';


abstract class MovieRepository {
  Future<Either<Exception, List<Movie>>>? searchMovie(String keyword);

}
