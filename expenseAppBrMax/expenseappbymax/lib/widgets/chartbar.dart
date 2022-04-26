import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double expensesAmount;
  final double percentageOFExpense;

  ChartBar(this.label, this.expensesAmount, this.percentageOFExpense);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 15,
            child: FittedBox(
                child: Text('JD ${expensesAmount.toStringAsFixed(0)}'))),
        const SizedBox(
          height: 4,
        ),
        Container(
          width: 10,
          height: 60,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            FractionallySizedBox(
              heightFactor: percentageOFExpense,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context).primaryColor)),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
