import 'dart:developer';
import 'dart:math' as math;

import 'package:bloc_architecture_learning/features/presentations/bloc/moviesearching/moviesearching_bloc.dart';
import 'package:bloc_architecture_learning/features/presentations/widgets/ui/movie_item.dart';
import 'package:bloc_architecture_learning/features/presentations/widgets/utility/lazy_load_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageSearchScreen extends StatelessWidget {
  const HomePageSearchScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.95),
        title: const Text("Search Movie"),
        bottom: PreferredSize(preferredSize: const Size.fromHeight(50),child:  Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 12),
          child: CupertinoSearchTextField(
                  backgroundColor: Colors.grey[250],
                  placeholder: "Key in any information you know",
                  onChanged: (txt) {
                    BlocProvider.of<MoviesearchingBloc>(context, listen: false)
                        .add(MovieSearchInputChange(text: txt));
                  },
                ),
        ),),
      ),
 
      body: Stack(
        fit: StackFit.expand,
        children: [
          BlocConsumer<MoviesearchingBloc, MoviesearchingState>(
        
            listener: (context, state) {
           log("listen to search bloc... $state");
            },
            builder: (context, state) {
              switch (state){
                
              }
             if (state is MoviesearchingStateSuccess){
               return LazyLoadScrollView(
                 onEndOfPage: (){
                   log("should fetch next page");
                 },
                 child: GridView.builder(
                      
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 100, top: 180),
                      itemCount: state.movies.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: math.min(MediaQuery.of(context).size.width / 2, 200),
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        bool isFavourite = false;
                        return MovieItem(key: Key(state.movies[index].id.toString()),context: context, movies: state.movies[index], isFavourite: isFavourite);
                      },
                    ),
               );
      
             }else if(state is MoviesearchingStateLoading){
               return Center(child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.orange[100],borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal:8.0,vertical: 5),
                  child: Text("Loading ... "),
                ),
              ),);
             }else if (state is MoviesearchingStateError){
      return Center(child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red[100],borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 5),
                  child: Text(state.error),
                ),
              ),);
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
