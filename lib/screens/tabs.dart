import 'package:flutter/material.dart';
import 'package:food_recipe/screens/categories.dart';
import 'package:food_recipe/screens/filters.dart';
import 'package:food_recipe/screens/meals.dart';
import 'package:food_recipe/widgets/drawer.dart';

import '../models/meal_model.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeal = [];

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message)
      ),
    );
  }

  void _toggleMealFavoriteState(Meal meal){
    final isExisting = _favoriteMeal.contains(meal);
    if(isExisting) {
      setState(() {
        _favoriteMeal.remove(meal);
      });
      _showInfoMessage('no longer favorite.');
    }else{
      setState(() {
        _favoriteMeal.add(meal);
      });
      _showInfoMessage('added to favorite');
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier){
    if(identifier == 'filters'){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FiltersScreen()));
    }else{
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget activePage = CategoriesScreen(onToggleFavourite: _toggleMealFavoriteState,);
    var activePageTitle = 'Categories';
    if(_selectedPageIndex == 1){
      activePageTitle = 'Your favorite';
      activePage = MealsScreen( meals: _favoriteMeal,onToggleFavourite: _toggleMealFavoriteState,);

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
         BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'categories'),
         BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favorites'),
        ],
      ),
    );
  }
}
