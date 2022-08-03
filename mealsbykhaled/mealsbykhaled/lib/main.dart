import 'package:flutter/material.dart';
import 'package:mealsbykhaled/mealsappdata.dart';
import 'package:mealsbykhaled/models/meals.dart';
import 'package:mealsbykhaled/pages/catergoryItempage.dart';
import 'package:mealsbykhaled/pages/favoritepage.dart';
import 'package:mealsbykhaled/pages/filterpage.dart';
import 'package:mealsbykhaled/pages/itemdetails.dart';
import './pages/botttomNavigationPage.dart';
import '../pages/categorypage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> filteredMeals = DUMMY_MEALS;

  Map<String, bool> filter = {
    'glutten': false,
    'vegetrian': false,
    'vegan': false,
    'lactos': false
  };

  void filterSwitch(Map<String, bool> filterArg) {
    filter = filterArg;

    setState(() {
      filteredMeals.where((eachMeal) {
        if (filter['glutten']! && !eachMeal.isGlutenFree) {
          print('filter[glutten]!: ${filter['glutten']!}');
          print('!eachMeal.isGlutenFree :${!eachMeal.isGlutenFree}');
          return false;
        }

        if (filter['vegetrian']! && !eachMeal.isVegetarian) {
          return false;
        }
        if (filter['vegan']! && !eachMeal.isVegan) {
          return false;
        }
        if (filter['lactos']! && !eachMeal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigationBarPage(),
      routes: {
        CatergoryItemPage.routeName: (context) =>
            CatergoryItemPage(filteredMeals),
        ItemsDetails.rounteName: (context) => ItemsDetails(),
        FilterPage.routeName: (context) => FilterPage(
              filterSwitch,
              filter,
            ),
        CategoryPage.routeName: (context) => CategoryPage(),
        FavoritePage.routeName: (context) => FavoritePage(),
      },
    );
  }
}
