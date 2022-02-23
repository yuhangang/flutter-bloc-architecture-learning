part of 'favoritemovie_bloc.dart';

abstract class FavoritemovieEvent extends Equatable {
  const FavoritemovieEvent();

  @override
  List<Object> get props => [];



}
class FavoritemovieInit  extends FavoritemovieEvent {

}

class FavouriteMovieAdded extends FavoritemovieEvent {
 final  Movie movie;
 const FavouriteMovieAdded({
    required this.movie,
  });
}

class FavouriteMovieRemoved extends FavoritemovieEvent {
final   Movie movie;
 const FavouriteMovieRemoved({
    required this.movie,
  });
}

class FavouriteMovieSync extends FavoritemovieEvent{
  
}