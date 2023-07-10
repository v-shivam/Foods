import 'package:flutter/material.dart';

class FoodItemtrait extends StatelessWidget {
  const FoodItemtrait({super.key, required this.ic_on, required this.lab_el});
  final IconData ic_on;
  final String lab_el;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          ic_on,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          lab_el,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
