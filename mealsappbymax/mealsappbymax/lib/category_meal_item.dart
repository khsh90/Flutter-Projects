import 'package:flutter/material.dart';

class CatergoryMealItem extends StatelessWidget {
  final String id;
  final String title;

  CatergoryMealItem({required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('CategoryMealScreen'),
      ),
    );
  }
}
