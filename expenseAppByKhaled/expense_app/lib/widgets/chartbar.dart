import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String title;
  final double amount;
  double totlaPercantage;

  ChartBar(this.title, this.amount, this.totlaPercantage);
  @override
  Widget build(BuildContext context) {
    // return Text('${title}${amount}');
    return Column(
      children: [
        Text(
          amount.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 90,
          width: 13,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.grey, style: BorderStyle.solid),
                    color: const Color.fromRGBO(220, 220, 220, 1)),
              ),
              FractionallySizedBox(
                heightFactor: totlaPercantage,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid),
                      color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
