import 'package:flutter/material.dart';
import 'package:meals/wi_d_gets/food_item_tr_ait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../blueprints/food.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.food, required this.onChooseFood});
  final Food food;
  final void Function(BuildContext context, Food food) onChooseFood;
  String get complexityText {
    return food.complexity.name[0].toUpperCase() +
        food.complexity.name.substring(1);
  }

  String get affodabilityText {
    return food.affordability.name[0].toUpperCase() +
        food.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2.9,
      child: InkWell(
        onTap: () {
          onChooseFood(context, food);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(food.imageUrl),
              fit: BoxFit.cover,
              height: 230,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      food.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, //Very long text ......
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FoodItemtrait(
                            ic_on: Icons.schedule,
                            lab_el: '${food.duration} min'),
                        const SizedBox(
                          width: 12,
                        ),
                        FoodItemtrait(
                            ic_on: Icons.work, lab_el: '$complexityText min'),
                        FoodItemtrait(
                          ic_on: Icons.attach_money,
                          lab_el: affodabilityText,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
