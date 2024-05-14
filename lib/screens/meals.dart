import 'package:flutter/material.dart';
import 'package:food_recipe/widgets/meal_item.dart';
import '../models/meal_model.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,required this.title,required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
        itemBuilder: (ctx,idx) => MealItem(
          meal: meals[idx],
        )
    );
    if(meals.isEmpty){
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('uh oh ... nothing here!',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text('Try selecting another category',)
          ],
        ),
      );

    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
