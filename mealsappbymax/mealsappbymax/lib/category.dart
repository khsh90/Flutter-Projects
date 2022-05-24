import 'dart:ui';

import 'package:flutter/material.dart';

class Category {
  final String id;
  final Color itemColor;
  final String title;

  const Category(
      {required this.id, required this.title, this.itemColor = Colors.green});
}
