import 'package:flutter/material.dart';
import 'package:mealsbykhaled/widgets/categorypagewidget.dart';
import '../mealsappdata.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category Screen'),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: categoryMealData
              .map((eachMeal) => CategoryPageWidget(
                    id: eachMeal.id,
                    categoryName: eachMeal.categoryName,
                    categoryColor: eachMeal.categoryColor,
                  ))
              .toList(),
        ));
  }
}
