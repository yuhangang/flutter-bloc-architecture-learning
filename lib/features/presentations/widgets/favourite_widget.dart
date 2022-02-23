import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:bloc_architecture_learning/features/presentations/bloc/favoritemovie/favoritemovie_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final Movie movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritemovieBloc, FavoritemovieState>(
        
      builder: (context, state) {
           final checkIsFavourite = state.checkIsFavourite(movies);
        return Align(
          alignment: Alignment.centerRight,
          child: InkWell(
              onTap: () {
                if (!checkIsFavourite){
                  BlocProvider.of<FavoritemovieBloc>(context,listen: false).add(FavouriteMovieAdded(movie: movies));
                }else{
                  BlocProvider.of<FavoritemovieBloc>(context,listen: false).add(FavouriteMovieRemoved(movie: movies));
                }
              },
              child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Icon(
                    checkIsFavourite
                        ? CupertinoIcons.star_fill
                        : CupertinoIcons.star,
                    color: Colors.white,
                  ))),
        );
      },
    );
  }
}
