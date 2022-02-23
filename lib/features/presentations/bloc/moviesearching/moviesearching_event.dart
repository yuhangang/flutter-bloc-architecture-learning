part of 'moviesearching_bloc.dart';

abstract class MoviesearchingEvent extends Equatable {
  const MoviesearchingEvent();

  @override
  List<Object> get props => [];
}




class MovieSearchInputChange extends MoviesearchingEvent{
  const MovieSearchInputChange({required this.text});
 final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
class MovieSearchNextPage extends MoviesearchingEvent{}