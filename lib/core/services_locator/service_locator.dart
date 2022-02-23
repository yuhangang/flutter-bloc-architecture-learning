import 'package:bloc_architecture_learning/core/helper/network_helper/network_info_helper.dart';
import 'package:bloc_architecture_learning/core/helper/network_helper/network_info_helper_impl.dart';
import 'package:bloc_architecture_learning/env/env_dev.dart';
import 'package:bloc_architecture_learning/env/i_env.dart';
import 'package:bloc_architecture_learning/features/data/data_sources/movie_datasource.dart';
import 'package:bloc_architecture_learning/features/data/data_sources/movie_local_datasource.dart';
import 'package:bloc_architecture_learning/features/data/repository/movie_repository.dart';
import 'package:bloc_architecture_learning/features/data/repository/movie_repository_impl.dart';
import 'package:bloc_architecture_learning/features/presentations/bloc/favoritemovie/favoritemovie_bloc.dart';
import 'package:bloc_architecture_learning/features/presentations/bloc/moviesearching/moviesearching_bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async{
  
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton<NetworkInfoHelper>(
      () => NetworkInfoHelperImpl(sl()));
         sl.registerLazySingleton<IAppEnv>(
      () => AppEnvDev()); 
  sl.registerLazySingleton<MovieDataSource>(
      () => MovieDataSourceImpl(dio: sl(),env: sl()));
  sl.registerLazySingleton<
          MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());
  sl.registerLazySingleton<MovieRepository>(() =>MovieRepositoryImpl(movieDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton(
      () => DataConnectionChecker());
      sl.registerLazySingleton<MoviesearchingBloc>(() => MoviesearchingBloc(movieRepository: sl()));
   
      sl.registerLazySingleton<FavoritemovieBloc>(() => FavoritemovieBloc(dataSource: sl()));
}