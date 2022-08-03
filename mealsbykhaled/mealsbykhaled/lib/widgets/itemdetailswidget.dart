import 'package:flutter/material.dart';

class ItemDetailsWidget extends StatelessWidget {
  final String itemPictireURL;
  final List<String> itemDetailsIngrediants;
  final List<String> itemDetialsSteps;

  ItemDetailsWidget(
      {required this.itemPictireURL,
      required this.itemDetailsIngrediants,
      required this.itemDetialsSteps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          itemPictireURL,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Ingrediants',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: itemDetailsIngrediants.length,
                itemBuilder: (context, eachIngrediants) => Container(
                      height: 22,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.amber),
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 15),
                      child: Text(
                        ' ${eachIngrediants + 1}. ${itemDetailsIngrediants[eachIngrediants]}',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Steps',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: itemDetialsSteps.length,
                itemBuilder: (context, eachStep) => ListTile(
                      leading: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.amber,
                        child: Text(
                          '#${eachStep + 1}',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        '${itemDetialsSteps[eachStep]}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )),
          ),
        ),
      ],
    );
  }
}
