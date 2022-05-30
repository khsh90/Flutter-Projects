import 'package:flutter/material.dart';
import 'package:mealsappbymax/widgets/catergory_meal_item_widget.dart';
import '../dummydata.dart';

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
    final String? categoryId = modalArgs['id'];

    final filteredMeals = mealData
        .where((eachMeal) => eachMeal.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(title: Text(title!)),
        body: ListView.builder(
          itemBuilder: (context, index) => CategoryMealItemWidget(
              id: filteredMeals[index].id,
              title: filteredMeals[index].title,
              imageURL: filteredMeals[index].imageUrl,
              duration: filteredMeals[index].duration,
              complexity: filteredMeals[index].complexity,
              affordability: filteredMeals[index].affordability),
          itemCount: filteredMeals.length,
        ));
  }
}
