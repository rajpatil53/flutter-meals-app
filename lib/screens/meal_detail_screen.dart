import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static String routeName = '/meal-detail';
  final Function isFavorite;
  final Function toggleFavorite;

  MealDetailScreen(this.isFavorite, this.toggleFavorite);

  Widget sectionTitleBuilder(BuildContext ctx, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget sectionContentBuilder(Widget content) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      width: 300,
      child: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionTitleBuilder(context, "Ingredients"),
            sectionContentBuilder(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            sectionTitleBuilder(context, "Steps"),
            sectionContentBuilder(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${(index + 1)}'),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(selectedMeal.steps[index]),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(id),
        child: Icon(isFavorite(id) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
