import 'package:flutter/material.dart';
import 'package:mealsappbymax/catergory_item.dart';
import './dummydata.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivry App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            children: dummyCategries
                .map(
                  (cat) => CategoryItem(
                      id: cat.id, title: cat.title, itemColor: cat.itemColor),
                )
                .toList()),
      ),
    );
  }
}
