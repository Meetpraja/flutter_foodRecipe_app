import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/provider/meals_provider.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false
        });

  void setFilters(Map<Filters,bool> choosenFilters){
    state = choosenFilters;
  }

  void setFilter(Filters filters, bool isActive) {
    state = {
      ...state,
      filters: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
        (ref) => FiltersNotifier());

final filterMealsProvider = Provider((ref){
  final meals = ref.watch(mealProvider);
  final activeFilter = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activeFilter[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilter[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});