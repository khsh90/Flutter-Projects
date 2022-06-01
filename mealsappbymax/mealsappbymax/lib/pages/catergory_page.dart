import 'package:flutter/material.dart';
import 'package:mealsappbymax/widgets/catergory_item_widget.dart';
import '../dummydata.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // no need for scaffold when creating a tabbar
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Delivry App'),
    //   ),
    // body:
    return Padding(
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
    );
  }
}
