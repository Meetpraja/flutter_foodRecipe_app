import 'package:flutter/material.dart';
import 'package:food_recipe/data/dummy_data.dart';
import 'package:food_recipe/models/category_model.dart';
import 'package:food_recipe/widgets/category_grid_item.dart';
import 'package:food_recipe/screens/meals.dart';

import '../models/meal_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.onToggleFavourite});

  final void Function(Meal meal) onToggleFavourite;

  void _selectCatrgory(BuildContext context, Category category) {
    final filteredmeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredmeals, onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onselect: () {
                _selectCatrgory(context,category);
              },
            )
        ],
      ),
    );
  }
}
