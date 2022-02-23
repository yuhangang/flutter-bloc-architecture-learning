import 'package:auto_route/auto_route.dart';
import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:bloc_architecture_learning/features/presentations/view/home_page/home_page.dart';
import 'package:bloc_architecture_learning/features/presentations/view/movie_detail/movie_detail.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';


@MaterialAutoRouter(

  routes: <AutoRoute>[
    AutoRoute<void>(
      path: "/home",
      page: HomePage,
      initial: true,
    ),
    AutoRoute<void>(
      path: "/home",
      page: MovieDetailScreen,
      
    )
    ])
class MyRouter extends _$MyRouter {}

