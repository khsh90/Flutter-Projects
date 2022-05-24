import 'package:flutter/material.dart';
import 'category_meal_item.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color itemColor;
  CategoryItem(
      {required this.id, required this.title, required this.itemColor});

  void selectedCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(
    //   builder: (_) => CatergoryMealItem(
    //     id: id,
    //     title: title,
    //   ),
    // )

    // );

    // Navigator.of(ctx).pushNamed('CataegoryMealScreen',
    //     arguments: {'id': id, 'title': title});
//we used static in order to reduce the error
    Navigator.of(ctx).pushNamed(CatergoryMealItem.routerName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [itemColor.withOpacity(.7), itemColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
