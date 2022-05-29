

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:singular/views/pages/favorites_view.dart';
import 'package:singular/views/pages/home_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController(initialPage: 0);
  ValueNotifier<int> page = ValueNotifier(0);

  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Singular App'),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: page,
        builder: (context, value,child) {
          return BottomNavigationBar(
            currentIndex: page.value,
            onTap: (value) {
              page.value = value;
              _pageController.jumpToPage(value);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(LineIcons.heartAlt),label: 'Favorites')
            ],
          );
        },
      ),
      body: PageView(
        controller: _pageController,
        children:  const [
          Home(),
          FavoritesView()
        ],
      ),
    );
  }
}
