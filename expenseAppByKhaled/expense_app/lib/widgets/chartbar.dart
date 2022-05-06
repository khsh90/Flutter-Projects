import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String title;
  final double amount;

  ChartBar(this.title, this.amount);
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
          height: 77,
          width: 13,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, style: BorderStyle.solid),
              color: const Color.fromRGBO(220, 220, 220, 1)),
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
