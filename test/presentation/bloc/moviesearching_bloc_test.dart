import 'package:bloc_architecture_learning/features/presentations/bloc/moviesearching/moviesearching_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import '../shared_mocks/shared_mocks.mocks.dart';





 void main(){
    group('FavouriteMovieBloc',(){
   late MoviesearchingBloc moviesearchingBloc;
   setUp((){
   moviesearchingBloc = MoviesearchingBloc(movieRepository: MockMovieRepository());


   });
    test('initial favourite is empty', () {
      expect(moviesearchingBloc.state, MoviesearchingStateEmpty());
    });
   });

     
   blocTest<MoviesearchingBloc, MoviesearchingState>(
      'emit data when one data is added',
      build: () => MoviesearchingBloc(movieRepository: MockMovieRepository()),
      act: (bloc) => bloc.add(const MovieSearchInputChange(text: "new")),
      expect: () =>const  [
       MoviesearchingStateLoading(),
      MoviesearchingStateError("")
      ],
    );


 }