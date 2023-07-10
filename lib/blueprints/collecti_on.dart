import 'package:flutter/material.dart';

class Collection {
  const Collection({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
  final String id;
  final String title;
  final Color color;
}
