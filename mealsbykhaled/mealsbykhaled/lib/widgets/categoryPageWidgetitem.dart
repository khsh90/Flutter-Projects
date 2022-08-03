import 'package:flutter/material.dart';
import 'package:mealsbykhaled/models/meals.dart';
import '../pages/itemdetails.dart';

class WidgetItemsPage extends StatelessWidget {
  final String itemId;
  final String itemImageURL;
  final String itemTitle;
  final int mealDuratio;
  final Complexity simplictyOption;
  final Affordability affordabilityOption;

  WidgetItemsPage(
      {required this.itemId,
      required this.itemImageURL,
      required this.itemTitle,
      required this.mealDuratio,
      required this.simplictyOption,
      required this.affordabilityOption});

  String get spmlicityType {
    switch (simplictyOption) {
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

  String get affordabilityType {
    switch (affordabilityOption) {
      case Affordability.Pricey:
        return 'Pricey';

      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknow';
    }
  }

  @override
  Widget build(BuildContext context) {
    void eneterToItemDetails() {
      Navigator.of(context)
          .pushNamed(ItemsDetails.rounteName, arguments: itemId);
    }

    return InkWell(
      onTap: eneterToItemDetails,
      child: Container(
        color: Colors.white,
        height: 320,
        margin: const EdgeInsets.all(7),
        child: Card(
          elevation: 9,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Stack(children: [
                  Image.network(
                    fit: BoxFit.cover,
                    height: 260,
                    width: double.infinity,
                    itemImageURL,
                  ),
                  Positioned(
                      top: 205,
                      right: 1,
                      child: Container(
                        height: 55,
                        width: 300,
                        color: Colors.black.withOpacity(.4),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          textAlign: TextAlign.center,
                          softWrap: true,
                          '  $itemTitle',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ]),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 35,
                        ),
                        Text(
                          ' ${mealDuratio.toString()} min ',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.work,
                          size: 35,
                        ),
                        Text(
                          ' $spmlicityType',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_money,
                          size: 35,
                        ),
                        Text(
                          affordabilityType,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
