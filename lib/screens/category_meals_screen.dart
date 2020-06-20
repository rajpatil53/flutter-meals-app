import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

import '../models/meal.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final String routeName = "/category-meals";
  final List<Meal> _availableMeals;

  CategoryMealsScreen(this._availableMeals);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = args['id'];
    final categoryTitle = args['title'];
    final categoryMeals = _availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              imageUrl: categoryMeals[index].imageUrl,
            );
          },
        ),
      ),
    );
  }
}
