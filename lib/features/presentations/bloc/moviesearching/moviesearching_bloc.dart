import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture_learning/core/error/error.dart';
import 'package:bloc_architecture_learning/features/data/repository/movie_repository.dart';
import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'moviesearching_event.dart';
part 'moviesearching_state.dart';

const _duration = Duration(milliseconds: 1000);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}

class MoviesearchingBloc extends Bloc<MoviesearchingEvent, MoviesearchingState> {
 MovieRepository movieRepository;

  MoviesearchingBloc({required this.movieRepository}) : super(MoviesearchingStateEmpty()) {
   
      on<MovieSearchInputChange>(_onTextChanged, transformer: debounce(_duration));
    
  }
  
    void _onTextChanged(
    MovieSearchInputChange event,
    Emitter<MoviesearchingState> emit,
  ) async {
    final searchTerm = event.text;
    if (searchTerm.isEmpty) return emit(MoviesearchingStateEmpty());

    emit(MoviesearchingStateLoading());

    try {
      final results = await movieRepository.searchMovie(event.text);
     
     if (results!=null) {
       results.fold((l) => emit(const MoviesearchingStateError("something went wrong")), (r) => emit(MoviesearchingStateSuccess(movies: r)));
     } else {
       throw  ServerExceptions();
     }
    } catch (error) {
      log(error.toString());
      emit(const MoviesearchingStateError('something went wrong'));
    }
  }
}
