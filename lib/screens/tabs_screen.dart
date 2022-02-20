import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_page.dart';

class TabsSceen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsSceen(this.favoriteMeals);

  @override
  _TabsSceenState createState() => _TabsSceenState();
}

class _TabsSceenState extends State<TabsSceen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
    {
      'page': CategoriesPage(),
      'title': 'Categories',
    },
    {
      'page': FavouritesScreen(widget.favoriteMeals),
      'title': 'Favorites',
    }
  ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        selectedFontSize: 15,
        unselectedFontSize: 13,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              title: Text('Favorites'))
        ],
      ),
    );
  }
}
