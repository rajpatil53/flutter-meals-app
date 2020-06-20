import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': "Categories"},
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': "Your favorites"
      },
    ];
    super.initState();
  }

  int _currentPage = 0;

  void _selectPage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentPage]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_currentPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Colors.white,
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
    );
  }
}
