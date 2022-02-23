part of 'moviesearching_bloc.dart';

abstract class MoviesearchingState extends Equatable {
  const MoviesearchingState();
  
  @override
  List<Object> get props => [];
}

class MoviesearchingStateEmpty extends MoviesearchingState {}

class MoviesearchingStateLoading extends MoviesearchingState {
  const MoviesearchingStateLoading();
}

class MoviesearchingStateSuccess extends MoviesearchingState {
  final List<Movie> movies;
  const MoviesearchingStateSuccess({required this.movies});
}

class MoviesearchingStateError extends MoviesearchingState {
    const MoviesearchingStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}