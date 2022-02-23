import 'package:bloc_architecture_learning/commons/bloc/bloc_observer.dart';
import 'package:bloc_architecture_learning/core/router/router.dart';
import 'package:bloc_architecture_learning/features/data/data_sources/movie_local_datasource.dart';
import 'package:bloc_architecture_learning/features/data/model/movie_model.dart';
import 'package:bloc_architecture_learning/features/presentations/bloc/favoritemovie/favoritemovie_bloc.dart';
import 'package:bloc_architecture_learning/features/presentations/bloc/moviesearching/moviesearching_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_architecture_learning/core/services_locator/service_locator.dart' as service_locator;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart'
    as path_provider;

import 'features/domain/entities/movie.dart';
void main() async{
  
    WidgetsFlutterBinding.ensureInitialized();
     
 
   BlocOverrides.runZoned(
    () {
  
    },
    blocObserver: SimpleBlocObserver(),
  );

    final appDocumentDirectory = await path_provider
      .getApplicationDocumentsDirectory();
       await Hive.initFlutter(
      appDocumentDirectory.path);
  //   await  Hive.deleteFromDisk();
  Hive.registerAdapter<Movie>(MovieModelAdapter());
 

 
    movieBox =await Hive.openBox<Movie>("favourite_box");
     await service_locator.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({Key? key}) : super(key: key);
final _appRouter = MyRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider<MoviesearchingBloc>(create:(_)=>service_locator.sl<MoviesearchingBloc>() ),
      BlocProvider<FavoritemovieBloc>(create:(_)=>service_locator.sl<FavoritemovieBloc>() )
  ],
      child: MaterialApp.router(
    
        title: 'Flutter Demo',
        theme: ThemeData(
           splashColor: Colors.transparent,
    
      hoverColor: Colors.transparent,
      appBarTheme: const AppBarTheme(color: Colors.transparent,titleTextStyle: TextStyle(color: Colors.black87,fontSize: 20),systemOverlayStyle: SystemUiOverlayStyle.dark),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(elevation: 0,selectedItemColor: Colors.blueGrey[800],unselectedItemColor: Colors.grey[400]),
          
          primarySwatch: Colors.blue,
    
        ),
      
       routerDelegate: _appRouter.delegate(),
       routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
