import 'dart:math' as math;

import 'package:bloc_architecture_learning/features/presentations/bloc/favoritemovie/favoritemovie_bloc.dart';
import 'package:bloc_architecture_learning/features/presentations/bloc/moviesearching/moviesearching_bloc.dart';
import 'package:bloc_architecture_learning/features/presentations/widgets/ui/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageFavoriteScreen extends StatefulWidget {
  const HomePageFavoriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageFavoriteScreen> createState() => _HomePageFavoriteScreenState();
}

class _HomePageFavoriteScreenState extends State<HomePageFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.95),
        title: const Text("My Favourites"),
       
      ),
     body: Stack(
        fit: StackFit.expand,
        children: [
          BlocConsumer<FavoritemovieBloc, FavoritemovieState>(
            buildWhen: (previous,current)=>true,
            listener: (context, state) {
           
            },
            builder: (context, state) {
              switch (state){
                
              }
             if (state is FavoritemovieHasData){
               return GridView.builder(
                    
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 100, top: 180),
                    itemCount: state.favourites.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: math.min(MediaQuery.of(context).size.width / 2, 200),
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      bool isFavourite = false;
                      return MovieItem(context: context, movies: state.favourites.elementAt(index), isFavourite: isFavourite);
                    },
                  );
      
             }else{
                return Center(child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blueGrey[100],borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal:8.0,vertical: 5),
                  child: Text("No Data"),
                ),
              ),);
             }
            
            
            },
          ),
          
        ],
      ),
    );
  }
}
