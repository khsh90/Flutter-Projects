import 'package:flutter/material.dart';
import 'package:mealsappbymax/modals/meal.dart';
import 'package:mealsappbymax/widgets/catergory_meal_item_widget.dart';
import '../dummydata.dart';

class CatergoryMealItem extends StatefulWidget {
  static const routerName = '/CataegoryMealScreen';

  @override
  State<CatergoryMealItem> createState() => _CatergoryMealItemState();
}

class _CatergoryMealItemState extends State<CatergoryMealItem> {
  // final String id;
  List<Meal> filteredMeals = [];
  String? title;
  @override
  void didChangeDependencies() {
    //did change check after build contecxt if there change
    final modalArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    title =
        modalArgs['title']; //modal route will take the data from category_itrm
    String? categoryId = modalArgs['id'];

    filteredMeals = mealData
        .where((eachMeal) => eachMeal.categories.contains(categoryId))
        .toList();

    super.didChangeDependencies();
    print('did change');
  }

  void _deleteMeal(String id) {
    setState(() {
      filteredMeals.removeWhere((eachMeal) => eachMeal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: ListView.builder(
        itemBuilder: (context, index) => CategoryMealItemWidget(
          id: filteredMeals[index].id,
          title: filteredMeals[index].title,
          imageURL: filteredMeals[index].imageUrl,
          duration: filteredMeals[index].duration,
          complexity: filteredMeals[index].complexity,
          affordability: filteredMeals[index].affordability,
          deleteMeal: _deleteMeal,
        ),
        itemCount: filteredMeals.length,
      ),
    );
  }
}
