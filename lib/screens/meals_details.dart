import 'package:flutter/material.dart';

import '../models/meal_model.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
    required this.onToggleFavourite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            onToggleFavourite(meal);
          }, icon: Icon(Icons.star_border))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 14),
               Text(
                '- Ingradients',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 14,),
              for(final ingredient in meal.ingredients)
                Text(
                  '>  ${ingredient}',
                  style: const TextStyle(
                    fontSize: 14
                  ),
                ),const SizedBox(height: 14),
              Text(
                '- Steps',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 14,),
              for(final steps in meal.steps)
                Text(
                    '>  ${steps}',
                    style: const TextStyle(
                        fontSize: 14
                    ),
                  ),

            ],
          ),
        ),
      ),
    );
  }
}
