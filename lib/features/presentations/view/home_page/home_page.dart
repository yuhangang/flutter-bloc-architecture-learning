import 'package:bloc_architecture_learning/features/presentations/bloc/favoritemovie/favoritemovie_bloc.dart';
import 'package:bloc_architecture_learning/features/presentations/view/home_page/screens/favorite_screen.dart';
import 'package:bloc_architecture_learning/features/presentations/view/home_page/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int curPage =0;
@override
  void initState() {
  
    super.initState();
    BlocProvider.of<FavoritemovieBloc>(context,listen: false).add(FavoritemovieInit());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
     
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curPage,
        onTap: (index){
     setState(() {
            _pageController.jumpToPage(index);
            curPage = index;
     });
        },
         backgroundColor: Colors.white.withOpacity(0.95),
        items: const [
          BottomNavigationBarItem(
              label: "Search", icon: Icon(CupertinoIcons.search)),
          BottomNavigationBarItem(
              label: "My Favorites",
              icon: Icon(CupertinoIcons.square_favorites))
        ],
      ),
      body: PageView(controller: _pageController,physics: const NeverScrollableScrollPhysics(),children: const [HomePageSearchScreen(),HomePageFavoriteScreen()],),
    );
  }
}


