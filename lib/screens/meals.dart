import 'package:flutter/material.dart';
import 'package:food_recipe/screens/meals_details.dart';
import 'package:food_recipe/widgets/meal_item.dart';
import '../models/meal_model.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavourite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavourite;

  void _onselectMeal(BuildContext context,Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MealDetailScreen(meal: meal,onToggleFavourite: onToggleFavourite,)));
  }


  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
        itemBuilder: (ctx,idx) => MealItem(
          meal: meals[idx],
          onMealSelect: _onselectMeal,
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
    if(title == null){
      return content;
    }
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
  }
}
