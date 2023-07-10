import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/blueprints/collecti_on.dart';
import 'package:meals/main.dart';

class CollectionGridItem extends StatelessWidget {
  const CollectionGridItem(
      {super.key, required this.collection, required this.onChooseCollection});
  final Collection collection;
  final void Function() onChooseCollection;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChooseCollection,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                collection.color.withOpacity(0.49),
                collection.color.withOpacity(0.95),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          collection.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
