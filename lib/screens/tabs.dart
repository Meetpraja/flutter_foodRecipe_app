import 'package:flutter/material.dart';
import 'package:food_recipe/data/dummy_data.dart';
import 'package:food_recipe/screens/categories.dart';
import 'package:food_recipe/screens/filters.dart';
import 'package:food_recipe/screens/meals.dart';
import 'package:food_recipe/widgets/drawer.dart';

import '../models/meal_model.dart';

const kInitialFilters = {
  Filters.glutenFree : false,
  Filters.lactoseFree : false,
  Filters.vegetarian : false,
  Filters.vegan : false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeal = [];
  Map<Filters,bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _toggleMealFavoriteState(Meal meal) {
    final isExisting = _favoriteMeal.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeal.remove(meal);
      });
      _showInfoMessage('no longer favorite.');
    } else {
      setState(() {
        _favoriteMeal.add(meal);
      });
      _showInfoMessage('added to favorite');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
          MaterialPageRoute(builder: (context) => FiltersScreen(currentFilters: _selectedFilters,)));

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });

    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {

    final availableList = dummyMeals.where((meal){
      if(_selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filters.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedFilters[Filters.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavourite: _toggleMealFavoriteState,
      availableMeals: availableList,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePageTitle = 'Your favorite';
      activePage = MealsScreen(
        meals: _favoriteMeal,
        onToggleFavourite: _toggleMealFavoriteState,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
