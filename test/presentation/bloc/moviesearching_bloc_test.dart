import 'package:bloc_architecture_learning/env/env_dev.dart';
import 'package:bloc_architecture_learning/features/data/data_sources/movie_datasource.dart';
import 'package:bloc_architecture_learning/features/data/repository/movie_repository_impl.dart';
import 'package:bloc_architecture_learning/features/presentations/bloc/moviesearching/moviesearching_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import '../shared_mocks/shared_mocks.mocks.dart';





 void main(){
    group('FavouriteMovieBloc',(){
   late MoviesearchingBloc moviesearchingBloc;
   setUp((){
   moviesearchingBloc = _generateBloc();


   });
    test('initial favourite is empty', () {
      expect(moviesearchingBloc.state, MoviesearchingStateEmpty());
    });
      blocTest<MoviesearchingBloc, MoviesearchingState>(
      'emit loading state then outcome when one data is added',
      build: () => _generateBloc(),
      act: (bloc) {
        bloc.add(const MovieSearchInputChange(text: "new"));
      },
      expect: () =>const  [
       MoviesearchingStateLoading(),

      ],
    );
   });

     
 


 }

 MoviesearchingBloc _generateBloc() =>  MoviesearchingBloc(movieRepository: MovieRepositoryImpl(networkInfo: MockNetworkInfoHelper(),movieDataSource: MovieDataSourceImpl(dio: MockDio(),env: AppEnvDev())));