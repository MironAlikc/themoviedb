import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/movie_list/movie_list_widget.dart';
//import 'package:flutter_application_2/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  static final List<Widget> _widgetOptions = <Widget>[];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
      ),
      body: IndexedStack( // существуют одновремено только отображается один из них //Хронит все виджеты 
        index: _selectedTab,
        children: [
          const Text(
            'Index 0: Home',
          ),
          MovieListWidget(),
          const Text(
            'Index 1: Business',
          ),
          const Text(
            'Index 2: School',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Фильмы',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
