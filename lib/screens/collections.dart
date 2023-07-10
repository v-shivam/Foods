import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/blueprints/food.dart';
import 'package:meals/data/data_sample.dart';
import 'package:meals/screens/foods.dart';
import 'package:meals/wi_d_gets/collection_grid_items.dart';

import '../blueprints/collecti_on.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen(
      {super.key,
      required this.onToggleFavourite,
      required this.availableFoods});
  final void Function(Food food) onToggleFavourite;
  final List<Food> availableFoods;

  void _chooseCollection(BuildContext context, Collection collection) {
    final filteredFoods = availableFoods
        .where((food) => food.collections.contains(collection.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => FoodsScreen(
          title: collection.title,
          foods: filteredFoods,
          onToggleFavourite: onToggleFavourite,
        ),
      ),
    ); //Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // availableCollection.map((collection) => CollectionGridItem(collection: collection)
        for (final collection in availableCollections)
          CollectionGridItem(
            collection: collection,
            onChooseCollection: () {
              _chooseCollection(context, collection);
            },
          )
      ],
    );
  }
}
