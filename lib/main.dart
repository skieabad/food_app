import 'package:flutter/material.dart';
import './models/food.dart';
import './screens/settings_screen.dart';
import './screens/category_food_screen.dart';
import './screens/food_details_screen.dart';
import './screens/tabs_screen.dart';
import 'data/category_data.dart';
import 'themes.dart';


void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: prefer_final_fields
  Map<String, bool> _settings = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Food> _availableFood = dummyFood;
  // ignore: prefer_final_fields
  List<Food> _favoriteFood = [];

  void _setSettings(Map<String, bool> settingData) {
    setState(() {
      _settings = settingData;

      _availableFood = dummyFood.where((element) {
        // exclude meals that do have gluten in it
        if (_settings['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_settings['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_settings['vegan'] && !element.isVegan) {
          return false;
        }
        if (_settings['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteFood.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteFood.removeAt(existingIndex);
        // ignore: avoid_print
        print(existingIndex);
      });
    } else {
      setState(() {
        _favoriteFood
            .add(dummyFood.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isFoodFavorite(String id) {
    return _favoriteFood.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = FoodAppTheme.light();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie App',
      theme: theme,
      initialRoute: '/', // the '/' is the default
      routes: {
        '/': (ctx) => TabsScreen(
              favoriteFood: _favoriteFood,
            ),
        CategoryFoodScreen.routeName: (ctx) => CategoryFoodScreen(
              availableFood: _availableFood,
            ),
        FoodDetailsScreen.routeName: (ctx) => FoodDetailsScreen(
              isFoodFavorite: _isFoodFavorite,
              toogleFavorite: _toggleFavorite,
            ),
        SettingsScreen.routeName: (ctx) => SettingsScreen(
              currentSettings: _settings,
              settings: _setSettings,
            ),
      },
    );
  }
}
