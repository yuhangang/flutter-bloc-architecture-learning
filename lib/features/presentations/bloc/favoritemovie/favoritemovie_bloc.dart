import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture_learning/features/data/data_sources/movie_local_datasource.dart';
import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'favoritemovie_event.dart';
part 'favoritemovie_state.dart';

class FavoritemovieBloc extends Bloc<FavoritemovieEvent, FavoritemovieState> {
  MovieLocalDataSource dataSource;
  FavoritemovieBloc({required this.dataSource}) : super(FavoritemovieEmpty()) {


  on<FavoritemovieInit>((event,emit)=> _handleFetchFromStorage(event,emit));
  
  on<FavouriteMovieAdded>((event, emit)=>    _handleAddFavourite(emit, event));
    
  on<FavouriteMovieRemoved>((event, emit)=>   _handleRemoveFavourite(event, emit));
  }

  Future<void> _handleFetchFromStorage(FavoritemovieInit event,Emitter<FavoritemovieState> emit )async {
     log("fetch from storage");
     try{
    final data = await dataSource.getFavourite();
    if (data!=null && data.isNotEmpty){
      emit(FavoritemovieHasDataSynced(favourites: data));
    }
     }catch(e){
       log("something wrong in fetching favourite from storage $e");
     }
  }

  Future<void> _handleRemoveFavourite(FavouriteMovieRemoved event, Emitter<FavoritemovieState> emit) async{
    if ((state is FavoritemovieHasData)== false) return;
         log("movie removing");
         final updatedFavourites = (state as FavoritemovieHasData).favourites.where((element) => element.id != event.movie.id).toSet();
         if (updatedFavourites.isEmpty){
            emit(FavoritemovieEmpty());
         }else{
    emit(FavoritemovieHasDataSynced(favourites: updatedFavourites));
         }
             await dataSource.removeFavourite({event.movie});
  }

  Future<void> _handleAddFavourite(Emitter<FavoritemovieState> emit, FavouriteMovieAdded event)async {
      log("movie adding $state");
        
     try {
       if (state is FavoritemovieHasData){
       
          emit(FavoritemovieHasDataSynced(favourites: {event.movie,...(state as FavoritemovieHasData).favourites}));
    
       }else{
           emit(FavoritemovieHasDataSynced(favourites: {event.movie}));
            
       }
      await dataSource.cacheFavourite(state.favourites);
     }  catch (e) {
      log("something wrong in adding favourite $e");
     }
  }
}
