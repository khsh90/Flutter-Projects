import 'package:flutter/material.dart';
import '../category.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> categries = [
    Category(id: 'c1', title: 'Arabic Food', itemColor: Colors.green),
    Category(id: 'c2', title: 'English Food', itemColor: Colors.blue),
    Category(id: 'c3', title: 'Italian Food', itemColor: Colors.orange),
    Category(id: 'c4', title: 'Spanish Food', itemColor: Colors.yellow),
    Category(id: 'c5', title: 'Russian Food', itemColor: Colors.purple),
    Category(id: 'c6', title: 'Indian Food', itemColor: Colors.grey),
    Category(id: 'c7', title: 'England Food', itemColor: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        maxCrossAxisExtent: 30,
        mainAxisExtent: 10,
      ),
      children: [],
    );
  }
}
