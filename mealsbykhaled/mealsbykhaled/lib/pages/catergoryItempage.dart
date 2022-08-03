import 'package:flutter/material.dart';
import 'package:mealsbykhaled/models/meals.dart';
import '../mealsappdata.dart';
import '../widgets/categoryPageWidgetitem.dart';

class CatergoryItemPage extends StatelessWidget {
  final List<Meal> newFilterMeal;

  CatergoryItemPage(this.newFilterMeal);

  static String routeName = '\CatergoryItemPage';

  @override
  Widget build(BuildContext context) {
    final dateFromCategoryPage =
        ModalRoute.of(context)?.settings.arguments as Map;

    String categoryName = dateFromCategoryPage['categoryName'];
    String categoryId = dateFromCategoryPage['id'];

    final List<Meal> filteredMeals = newFilterMeal
        .where((eachMeal) => eachMeal.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
        ),
        body: ListView.builder(
            itemCount: filteredMeals.length,
            itemBuilder: (context, eachMealItem) => WidgetItemsPage(
                  itemId: filteredMeals[eachMealItem].id,
                  itemImageURL: filteredMeals[eachMealItem].imageUrl,
                  itemTitle: filteredMeals[eachMealItem].title,
                  mealDuratio: filteredMeals[eachMealItem].duration,
                  simplictyOption: filteredMeals[eachMealItem].complexity,
                  affordabilityOption:
                      filteredMeals[eachMealItem].affordability,
                )));
  }
}
