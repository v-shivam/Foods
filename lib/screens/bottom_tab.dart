import 'package:flutter/material.dart';
import 'package:meals/blueprints/collecti_on.dart';
import 'package:meals/blueprints/food.dart';
import 'package:meals/data/data_sample.dart';
import 'package:meals/screens/collections.dart';
import 'package:meals/screens/foods.dart';
import 'package:meals/wi_d_gets/drawer.dart';

import 'filter_screen.dart';

const kInitialFilter = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class ButtomTabScreen extends StatefulWidget {
  const ButtomTabScreen({super.key});
  @override
  State<ButtomTabScreen> createState() {
    return _ButtonTabScreen();
  }
}

class _ButtonTabScreen extends State<ButtomTabScreen> {
  int _choosenScreenIndex = 0;
  final List<Food> _favouriteFoods = [];
  Map<Filter, bool> _choosenFilters = kInitialFilter;

  void _showInfoMessage(String messageConveyed) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(messageConveyed),
      ),
    );
  }

  void _toggleFoodFavouriteStatus(Food food) {
    final isPresent = _favouriteFoods.contains(food);
    if (isPresent) {
      setState(() {
        _favouriteFoods.remove(food);
      });
      _showInfoMessage('Meal removed from favorites');
    } else {
      setState(() {
        _favouriteFoods.add(food);
        _showInfoMessage('Meal added in favorites');
      });
    }
  }

  void _chooseScreen(int index) {
    setState(() {
      _choosenScreenIndex = index;
    });
  }

  void _setPage(String modifier) async {
    Navigator.of(context).pop();
    if (modifier == 'filters') {
      final resulting_booleans =
          await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => ScreenFilter(
            currentFilters: _choosenFilters,
          ),
        ),
      );
      setState(() {
        _choosenFilters = resulting_booleans ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableFoods = dummyFoods.where((meal) {
      if (_choosenFilters[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_choosenFilters[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_choosenFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_choosenFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget presentScreen = CollectionScreen(
      availableFoods: availableFoods,
      onToggleFavourite: _toggleFoodFavouriteStatus,
    );
    var presentScreenTitle = 'Collections';
    if (_choosenScreenIndex == 1) {
      presentScreen = FoodsScreen(
        foods: _favouriteFoods,
        onToggleFavourite: _toggleFoodFavouriteStatus,
      );
      presentScreenTitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(presentScreenTitle),
      ),
      drawer: HomeDrawer(
        onChooseScreen: _setPage,
      ),
      body: presentScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _choosenScreenIndex,
        onTap: _chooseScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
