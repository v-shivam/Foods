import 'package:flutter/material.dart';
import 'package:meals/blueprints/food.dart';
import 'package:meals/screens/food_details.dart';
import 'package:meals/wi_d_gets/food_item.dart';

class FoodsScreen extends StatelessWidget {
  const FoodsScreen(
      {super.key,
      this.title,
      required this.foods,
      required this.onToggleFavourite});

  final String? title;
  final List<Food> foods;
  final void Function(Food food) onToggleFavourite;
  void chooseFood(BuildContext context, Food food) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctz) => FoodDetailsScreen(
          food: food,
          onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget contz = ListView.builder(
      itemCount: foods.length,
      itemBuilder: (ctx, index) => FoodItem(
        food: foods[index],
        onChooseFood: chooseFood,
      ),
    );

    if (foods.isEmpty) {
      contz = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Nothing to show',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting our different collection!!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return contz;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: contz,
    );
  }
}
