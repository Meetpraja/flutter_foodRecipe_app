import 'package:food_recipe/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealProvider = Provider((ref){
  return dummyMeals;
});