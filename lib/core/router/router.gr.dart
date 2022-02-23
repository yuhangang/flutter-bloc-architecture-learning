// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$MyRouter extends RootStackRouter {
  _$MyRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return MaterialPageX<void>(routeData: routeData, child: const HomePage());
    },
    MovieDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailScreenRouteArgs>();
      return MaterialPageX<void>(
          routeData: routeData,
          child: MovieDetailScreen(key: args.key, movie: args.movie));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        RouteConfig(HomePageRoute.name, path: '/home'),
        RouteConfig(MovieDetailScreenRoute.name, path: '/home')
      ];
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [MovieDetailScreen]
class MovieDetailScreenRoute extends PageRouteInfo<MovieDetailScreenRouteArgs> {
  MovieDetailScreenRoute({Key? key, required Movie movie})
      : super(MovieDetailScreenRoute.name,
            path: '/home',
            args: MovieDetailScreenRouteArgs(key: key, movie: movie));

  static const String name = 'MovieDetailScreenRoute';
}

class MovieDetailScreenRouteArgs {
  const MovieDetailScreenRouteArgs({this.key, required this.movie});

  final Key? key;

  final Movie movie;

  @override
  String toString() {
    return 'MovieDetailScreenRouteArgs{key: $key, movie: $movie}';
  }
}
