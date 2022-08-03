import 'package:flutter/material.dart';
import 'package:mealsbykhaled/pages/catergoryItempage.dart';
import 'package:mealsbykhaled/widgets/categorypagewidget.dart';
import 'package:mealsbykhaled/widgets/drawerwidget.dart';
import '../mealsappdata.dart';

class CategoryPage extends StatelessWidget {
  static String routeName = '/CategoryPage';
  @override
  Widget build(BuildContext context) {
    void goToCategoryItemPage() {
      Navigator.pushNamed(context, CatergoryItemPage.routeName);
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Category Screen'),
      // ),
      body: InkWell(
        onDoubleTap: goToCategoryItemPage,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: categoryMealData
              .map((eachMeal) => CategoryPageWidget(
                    id: eachMeal.id,
                    categoryName: eachMeal.title,
                    categoryColor: eachMeal.color,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
