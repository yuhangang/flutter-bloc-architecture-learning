import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:bloc_architecture_learning/features/presentations/bloc/favoritemovie/favoritemovie_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import '../shared_mocks/shared_mocks.mocks.dart';

void main() {
  late MockMovieLocalDataSource mockMovieLocalDataSource;
  final Movie movie = Movie(
      adult: true,
      backdrop_path: "",
      genre_ids: const [],
      id: 1,
      original_language: "en",
      original_title: "original title",
      overview: "overview",
      popularity: 7,
      release_date: DateTime(2020, 01, 01),
      title: "title",
      video: true,
      vote_average: 5.5,
      vote_count: 100);

  setUp(() {
    mockMovieLocalDataSource = MockMovieLocalDataSource();
  });

  group('FavouriteMovieBloc', () {
    late FavoritemovieBloc favoritemovieBloc;
    setUp(() {
      favoritemovieBloc =
          FavoritemovieBloc(dataSource: mockMovieLocalDataSource);
    });
    test('initial favourite is empty', () {
      expect(favoritemovieBloc.state, FavoritemovieEmpty());
    });
    //  test('initial favourite is not empty', () {
    //     expect(favoritemovieBloc.state, const FavoritemovieHasDataSynced(favourites: {}));
    // });
    blocTest<FavoritemovieBloc, FavoritemovieState>(
      'emit data when one data is added',
      build: () => FavoritemovieBloc(dataSource: mockMovieLocalDataSource),
      act: (bloc) => bloc.add(FavouriteMovieAdded(movie: movie)),
      expect: () => [
        FavoritemovieHasDataSynced(favourites: {movie})
      ],
    );
    blocTest<FavoritemovieBloc, FavoritemovieState>(
      'emits empty when data is added then deleted again',
      build: () => FavoritemovieBloc(dataSource: mockMovieLocalDataSource),
      act: (bloc) {
        bloc.add(FavouriteMovieAdded(movie: movie));
        bloc.add(FavouriteMovieRemoved(movie: movie));
      },
      expect: () => [
        FavoritemovieHasDataSynced(favourites: {movie}),
        FavoritemovieEmpty()
      ],
    );
  });
}
