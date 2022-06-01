// import 'dart:ui';

import 'package:flutter/material.dart';
import '../pages/fliterspage.dart';
import '../pages/bottombarPage.dart';
import '../pages/item_detail_page.dart';
// import 'package:mealsappbymax/pages/tabbarpage.dart';
import 'pages/category_meal_item._page.dart';
import 'pages/catergory_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (context) => BottomBarViewPage(),
        // '/CataegoryMealScreen': ((context) => CatergoryMealItem())
        //we use static instaded of above to reduce errors
        CatergoryMealItem.routerName: (context) => CatergoryMealItem(),
        ItemDetailScreen.routerName: (context) => ItemDetailScreen(),
        FiltersPage.routeName: (context) => FiltersPage(),
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
