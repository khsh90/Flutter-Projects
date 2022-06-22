import 'package:flutter/material.dart';

class CategoryPageWidget extends StatelessWidget {
  final String id;
  final String categoryName;
  final Color categoryColor;

  CategoryPageWidget(
      {required this.id,
      required this.categoryName,
      required this.categoryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          gradient: LinearGradient(
              colors: [categoryColor.withOpacity(.7), categoryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Text(
        categoryName,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
