import 'package:bloc_architecture_learning/commons/extensions/extensions.dart';
import 'package:bloc_architecture_learning/features/domain/entities/movie.dart';
import 'package:bloc_architecture_learning/features/presentations/widgets/favourite_widget.dart';
import 'package:bloc_architecture_learning/features/presentations/widgets/my_image_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MovieDetailScreen extends StatelessWidget {
  static const route = "/details";
  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: detailAppBar(context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: movie.id,
            child: MyImageBuilder.buildThumbNail(movie.backdrop_path,
                original: true),
          ),
          DetailFadeIn(
            movie: movie,
          ),
        ],
      ),
    );
  }

  AppBar detailAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.back,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      actions: [
   
         
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
              
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child:    FavouriteWidget(movies: movie),
                    ),
                  ),
                ),
              ),
           
        )
      ],
    );
  }
}

class DetailFadeIn extends StatefulWidget {
  const DetailFadeIn({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  _DetailFadeInState createState() => _DetailFadeInState();
}

class _DetailFadeInState extends State<DetailFadeIn> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => setState(() => isShow = true));
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: isShow ? 1 : 0,
      child: Container(
        decoration:const BoxDecoration(
            gradient: LinearGradient(stops: [
          0,
          0.1,
          0.3,
          1
        ], colors: [
          Colors.black26,
 Colors.black12,
          Colors.black54,
        Colors.black87
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Text(widget.movie.title?.toUpperCase()??'-',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF5ACFC6),
                      )),
              const SizedBox(
                height: 15,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Opacity(
                  opacity: 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tooltip(
                        message: 'average vote',
                        child: Row(
                          children: [
                            const Icon(CupertinoIcons.film,       color: Colors.white70,),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.movie.vote_average.toString(),
                              style: const TextStyle(
                                color: Colors.white70,
                                  fontSize: 22, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Tooltip(
                        message: 'release date',
                        child: Row(
                          children: [
                            const Icon(CupertinoIcons.time,       color: Colors.white70,),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                            widget.movie.release_date?.formattedDate??'-',
                              style: const TextStyle(
                                       color: Colors.white70,
                                  fontSize: 22, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.movie.overview??"-",
                style: const TextStyle(
                    fontSize: 20,
                    height: 1.6,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFFFFFFF),
                    letterSpacing: 1.1),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ))),
      ),
    );
  }
}