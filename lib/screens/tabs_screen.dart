import 'package:flutter/material.dart';
import '../models/food.dart';
import '../widgets/drawer_links.dart';
import './category_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Food> favoriteFood;

  const TabsScreen({
    Key key,
    this.favoriteFood,
  }) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  // if you want to display / update the title dynamically
  List<Map<String, Object>> _pages;

  // if you want to display only their screens
  // final List<Widget> _screens = [
  //   const CategoryScreen(),
  //   const FavoritesScreen(),
  // ];

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'screens': const CategoryScreen(),
        'title': 'Categories',
      },
      {
        'screens': FavoritesScreen(
          favoriteFood: widget.favoriteFood,
        ),
        'title': 'Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          // style: GoogleFonts.lato(
          //   fontSize: 20,
          // ),
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _pages[_selectedPageIndex]['screens'],
      drawer: const DrawerLinks(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedPageIndex,
        onTap: (int index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
