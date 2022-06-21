import 'package:flutter/material.dart';
import '../pages/categorypage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryPage(),
    );
  }
}

// class KhaledMeals extends StatefulWidget {
//   @override
//   State<KhaledMeals> createState() => _KhaledMealsState();
// }

// class _KhaledMealsState extends State<KhaledMeals> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Khaled Meals'),
//       ),
//       body: const Center(
//         child: Text('Khaled Meals'),
//       ),
//     );
//   }
// }
