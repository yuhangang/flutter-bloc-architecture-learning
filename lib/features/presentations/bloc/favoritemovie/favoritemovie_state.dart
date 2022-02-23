part of 'favoritemovie_bloc.dart';

abstract class FavoritemovieState extends Equatable {
    final Set<Movie> favourites;
  const FavoritemovieState({required this.favourites});
  
    @override
  List<Object> get props => [favourites];

 @nonVirtual
 bool checkIsFavourite(Movie movie) {
    
     return favourites.contains(movie);
   }
  
}



class FavoritemovieEmpty extends FavoritemovieState {
  FavoritemovieEmpty() : super(favourites:{});
}




abstract class FavoritemovieHasData extends FavoritemovieState {
 

  const FavoritemovieHasData({
    required Set<Movie> favourites,
  }):super(favourites: favourites);

 
}

class FavoritemovieHasDataSynced extends FavoritemovieHasData {
  const FavoritemovieHasDataSynced({required Set<Movie> favourites}) : super(favourites: favourites);

}
//class FavoritemovieHasDataSyncing extends FavoritemovieHasData {
//   const FavoritemovieHasDataSyncing({required Set<Movie> favourites}) : super(favourites: favourites);
//}
//class FavoritemovieHasDataUnsynced extends FavoritemovieHasData {
//   const FavoritemovieHasDataUnsynced({required Set<Movie> favourites}) : super(favourites: favourites);
//}