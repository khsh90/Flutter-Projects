import 'package:flutter/material.dart';
import 'package:mealsbykhaled/mealsappdata.dart';
import 'package:mealsbykhaled/widgets/itemdetailswidget.dart';

class ItemsDetails extends StatelessWidget {
  static String rounteName = '/ItemsDetails';

  @override
  Widget build(BuildContext context) {
    final itemId = ModalRoute.of(context)?.settings.arguments as String;

    final filtredList = DUMMY_MEALS
        .where((eachMealdetails) => eachMealdetails.id == itemId)
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text('Item Details Page'),
        ),
        body: ListView.builder(
            itemCount: filtredList.length,
            itemBuilder: ((context, eachMealdetails) => ItemDetailsWidget(
                  itemPictireURL: filtredList[eachMealdetails].imageUrl,
                  itemDetailsIngrediants:
                      filtredList[eachMealdetails].ingredients,
                  itemDetialsSteps: filtredList[eachMealdetails].steps,
                ))));
  }
}
