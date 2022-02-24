import 'package:bloc_architecture_learning/features/data/data_sources/movie_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../shared_mocks/shared_mocks.dart';
import '../shared_mocks/shared_mocks.mocks.dart';

main(){
  late MovieDataSource dataSource;
  setUp((){
   // dataSource = MovieDataSourceImpl(dio: MockDio(),env: AppEnvDev());
  });
  dataSource = MockMovieDataSource();
  test('Testing api get search word',()async{
        when(dataSource.searchMovie("new"))
          .thenAnswer((_) async => [movie]);
   final result = await dataSource.searchMovie("new");
   expect(result, [movie]);
     verify(dataSource.searchMovie("new"));
      verifyNoMoreInteractions(dataSource);

  });
}