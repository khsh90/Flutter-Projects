import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:mealsappbymax/pages/category_meal_item._page.dart';
import 'package:mealsappbymax/pages/item_detail_page.dart';
import '/modals/meal.dart';

class CategoryMealItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function deleteMeal;

  CategoryMealItemWidget(
      {required this.id,
      required this.title,
      required this.imageURL,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.deleteMeal});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unknow';
    }
  }

  String get affodabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Luxurious:
        return 'Luxurious';

      case Affordability.Pricey:
        return 'Pricey';

      default:
        return 'Unknow';
    }
  }

  void seletedMealItem(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(ItemDetailScreen.routerName, arguments: id)
        .then((result) {
      if (result != null) {
        deleteMeal(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => seletedMealItem(context),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageURL,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 70,
                child: Container(
                  width: 400,
                  color: Colors.black45,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  child: Text(
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    title,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]),
            const Padding(padding: EdgeInsets.all(7)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '$duration min',
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      complexityText,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      affodabilityText,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
