// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealsappbymax/dummydata.dart';
import '../pages/fliterspage.dart';
import '../pages/bottombarPage.dart';
import '../pages/item_detail_page.dart';
// import 'package:mealsappbymax/pages/tabbarpage.dart';
import 'modals/meal.dart';
import 'pages/category_meal_item._page.dart';
import 'pages/catergory_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filter = {
    'glutenFree': false,
    'vegetarian': false,
    'vegan': false,
    'lactosFree': false,
  };
  List<Meal> filteredMeals = mealData;
  List<Meal> favoiroteMeal = [];

  void toggleFavoriteMeals(String mealId) {
    final exsitedIndex =
        favoiroteMeal.indexWhere((eachMeal) => eachMeal.id == mealId);

    if (exsitedIndex >= 0) {
      setState(() {
        favoiroteMeal.removeAt(exsitedIndex);
      });
    } else {
      setState(() {
        favoiroteMeal
            .add(mealData.firstWhere((eachMeal) => eachMeal.id == mealId));
      });
    }
  }

  bool isFavorite(String mealId) {
    return favoiroteMeal.any((eachMeal) => eachMeal.id == mealId);
  }

  void _enableFilter(Map<String, bool> filterData) {
    setState(() {
      filter = filterData;
      filteredMeals = mealData.where((eachMeal) {
        if (filter['glutenFree']! && !eachMeal.isGlutenFree) {
          print(filter['glutenFree']!);

          return false;
        }
        if (filter['vegetarian']! && !eachMeal.isVegetarian) {
          print(filter['vegetarian']!);
          print(!eachMeal.isVegetarian);
          return false;
        }
        if (filter['vegan']! && !eachMeal.isVegan) {
          print('ok vegan');
          return false;
        }
        if (filter['lactosFree']! && !eachMeal.isLactoseFree) {
          print('ok lactosFree');
          return false;
        }
        print('ok true');
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Max DeliveryApp',
      theme: ThemeData(
          colorScheme:
              Theme.of(context).colorScheme.copyWith(secondary: Colors.amber),
          primaryColor: Colors.pink,
          appBarTheme: AppBarTheme.of(context).copyWith(
            color: Colors.pink,
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium:
                  const TextStyle(color: Color.fromARGB(255, 198, 230, 230)),
              titleMedium: const TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          fontFamily: 'RobotoCondensed'),
      // home: CategoryScreen(),
      routes: {
        '/': (context) => BottomBarViewPage(favoiroteMeal),
        // '/CataegoryMealScreen': ((context) => CatergoryMealItem())
        //we use static instaded of above to reduce errors
        CatergoryMealItem.routerName: (context) =>
            CatergoryMealItem(filteredMeals),
        ItemDetailScreen.routerName: (context) =>
            ItemDetailScreen(toggleFavoriteMeals, isFavorite),
        FiltersPage.routeName: (context) => FiltersPage(_enableFilter, filter),
      },

      //if one of pages not exists will get back to main screen
      onGenerateRoute: (setting) {
        return MaterialPageRoute(
          builder: (context) => CategoryScreen(),
        );
      },

//if the onGenerateRoute not have the page we want will go into onUnknownRoute ,better than. of give the user an error
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (context) => CategoryScreen());
      },
    );
  }
}
