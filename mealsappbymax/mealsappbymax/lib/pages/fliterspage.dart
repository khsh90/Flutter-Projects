import 'package:flutter/material.dart';
import 'package:mealsappbymax/widgets/drawer.dart';

class FiltersPage extends StatelessWidget {
  static String routeName = '/FiltersPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Screen'),
        backgroundColor: Colors.red,
      ),
      drawer: AppDrawer(headerDrawerColor: Colors.red),
      body: Center(child: Text('Filter Screen')),
    );
  }
}
