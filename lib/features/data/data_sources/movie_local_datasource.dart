import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';

import 'package:hive/hive.dart';

late final Box<Movie> movieBox;

abstract class MovieLocalDataSource {

  Future<Set<Movie>?> cacheFavourite(
      Set<Movie> newFavourite);

  Future<Set<Movie>?> getFavourite();

  Future<Set<Movie>?> removeFavourite(
      Set<Movie> movie) ;
}

class MovieLocalDataSourceImpl
    implements MovieLocalDataSource {
  
  final Box<Movie> movieBox;
  MovieLocalDataSourceImpl({required this.movieBox});
  // final HiveInterface hive;
  @override
  Future<Set<Movie>?> cacheFavourite(
      Set<Movie> movie) async {
    // await drinkBox?.clear();
     for (final m in movie){
    await movieBox.put(m.id, m);
    }

    return movie;
  }

   @override
  Future<Set<Movie>?> removeFavourite(
      Set<Movie> movie) async {
    // await drinkBox?.clear();
    for (final m in movie){
   await movieBox.delete(m.id);
    }
    return movie;
  }



  @override
  Future<Set<Movie>?> getFavourite() {
    return Future.value(
        movieBox.values.toSet()) ;
  }


}
