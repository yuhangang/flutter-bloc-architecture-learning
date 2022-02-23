import 'package:bloc_architecture_learning/core/helper/network_helper/network_info_helper.dart';
import 'package:bloc_architecture_learning/env/i_env.dart';
import 'package:bloc_architecture_learning/features/data/data_sources/movie_local_datasource.dart';
import 'package:bloc_architecture_learning/features/data/repository/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';


@GenerateMocks([MovieRepository,NetworkInfoHelper,IAppEnv,Dio],customMocks: [
    MockSpec<MovieLocalDataSource>(returnNullOnMissingStub: true),
])
void main(){}