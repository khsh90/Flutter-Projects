import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../catergory_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryScreen(),
      title: 'Max DeliveryApp',
      theme: ThemeData(
          colorScheme:
              Theme.of(context).colorScheme.copyWith(secondary: Colors.amber),
          primaryColor: Colors.pink,
          appBarTheme: AppBarTheme.of(context).copyWith(
            color: Colors.pink,
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: const TextStyle(
                  fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
          fontFamily: 'RobotoCondensed'),
    );
  }
}
