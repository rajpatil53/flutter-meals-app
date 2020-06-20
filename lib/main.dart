import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

import './models/meal.dart';
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  Map<String, bool> _currentFilters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'veg': false,
  };

  void _updateFilters(filters) {
    setState(() {
      _currentFilters = filters;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_currentFilters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_currentFilters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_currentFilters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_currentFilters['veg'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    int mealIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (mealIndex < 0) {
      setState(() {
        _favoriteMeals
            .add(_availableMeals.firstWhere((meal) => meal.id == mealId));
      });
    } else {
      setState(() {
        _favoriteMeals.removeAt(mealIndex);
      });
    }
  }

  bool _isFavorite(mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: const Color(0xff333333),
              ),
              body2: TextStyle(
                color: const Color(0xff333333),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoC",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (_) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(_isFavorite, _toggleFavorites),
        FiltersScreen.routeName: (_) =>
            FiltersScreen(_currentFilters, _updateFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}
