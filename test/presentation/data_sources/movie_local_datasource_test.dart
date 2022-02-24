import 'dart:io';


import 'package:bloc_architecture_learning/features/data/data_sources/movie_local_datasource.dart';
import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

import '../shared_mocks/shared_mocks.dart';

class MockHiveInterface extends Mock implements HiveInterface {}
class MockHiveBox<T> extends Mock implements Box<T> {}


late Box<Movie> movieBoxTest;

void main(){
  
  late final  MovieLocalDataSourceImpl dataSourceImpl;
  // late final MockHiveInterface mockHiveInterface;
  late final MockHiveBox<Movie> mockHiveBox;

  
  setUp(()async{

 //mockHiveInterface = MockHiveInterface();
mockHiveBox = MockHiveBox();
   var path = Directory.current.path;
  Hive.init(path + '/test/hive_testing_path');
     movieBoxTest =await Hive.openBox<Movie>("favourite_box");
 dataSourceImpl = MovieLocalDataSourceImpl(movieBox: mockHiveBox);
  });

  group("Test Favourite Box insert data", ()async{
  
        test('initial favourite is empty', () async{
            await dataSourceImpl.cacheFavourite({movie});
      final item = await dataSourceImpl.getFavourite();
      expect(item!=null && item.isEmpty, true);
    });
  });
}
