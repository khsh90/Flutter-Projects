import 'package:flutter/material.dart';

class CatergoryMealItem extends StatelessWidget {
  static const routerName = '/CataegoryMealScreen';
  // final String id;
  // final String title;

  // CatergoryMealItem({required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    final modalArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final String? title =
        modalArgs['title']; //modal route will take the data from category_itrm
    final String? id = modalArgs['id'];

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: const Center(
        child: Text('CategoryMealScreen'),
      ),
    );
  }
}
