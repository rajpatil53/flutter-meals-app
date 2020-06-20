import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          duration: favoriteMeals[index].duration,
          affordability: favoriteMeals[index].affordability,
          complexity: favoriteMeals[index].complexity,
          imageUrl: favoriteMeals[index].imageUrl,
        );
      },
    );
  }
}
