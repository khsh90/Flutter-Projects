import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../category_meal_item.dart';
import '../catergory_screen.dart';

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
                  fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
          fontFamily: 'RobotoCondensed'),
      home: CategoryScreen(),
      routes: {
        // '/CataegoryMealScreen': ((context) => CatergoryMealItem())
        //we use static instaded of above to reduce errors
        CatergoryMealItem.routerName: (context) => CatergoryMealItem(),
      },
    );
  }
}
