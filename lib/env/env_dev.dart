import 'package:bloc_architecture_learning/env/i_env.dart';

class AppEnvDev implements IAppEnv{

  @override
  String get apibaseUrl => "https://api.themoviedb.org/3";
  @override
  String get apiKey => "9c9576f8c2e86949a3220fcc32ae2fb6";

}