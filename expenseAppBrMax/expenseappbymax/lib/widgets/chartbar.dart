import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double expensesAmount;
  final double percentageOFExpense;
// you can use the const constructor wherever the data inside it is final as it will immutable.will never changed .
  const ChartBar(this.label, this.expensesAmount, this.percentageOFExpense);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        // layout bulider used to get the siz for widget by using constarains
        builder: (context, constraints) => Column(
              children: [
                Container(
                    height: constraints.maxHeight * .15,
                    child: FittedBox(
                        child:
                            Text('JD ${expensesAmount.toStringAsFixed(0)}'))),
                SizedBox(
                  height: constraints.maxHeight * .05,
                ),
                Container(
                  width: 10,
                  height: constraints.maxHeight * .6,
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
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Container(
                  height: constraints.maxHeight * .15,
                  child: FittedBox(
                    child: Text(label),
                  ),
                )
              ],
            ));
  }
}
