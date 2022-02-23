import 'package:auto_route/auto_route.dart';
import 'package:bloc_architecture_learning/core/router/router.dart';
import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:bloc_architecture_learning/features/presentations/bloc/favoritemovie/favoritemovie_bloc.dart';
import 'package:bloc_architecture_learning/features/presentations/widgets/favourite_widget.dart';
import 'package:bloc_architecture_learning/features/presentations/widgets/my_image_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.context,
    required this.movies,
    required this.isFavourite,
  }) : super(key: key);

  final BuildContext context;
  final Movie movies;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(MovieDetailScreenRoute(movie: movies));
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF000000)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: movies.id,
                child: MyImageBuilder.buildThumbNail(movies.backdrop_path),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(stops: [
                0,
                0.2,
                0.7,
                1
              ], colors: [
                Color(0x46000000),
                Color(0x11000000),
                Color(0x21000000),
                Color(0x42000000)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movies.title ?? "-",
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white),
                  ),
                  FavouriteWidget(movies: movies)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

