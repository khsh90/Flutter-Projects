import 'package:expenseappbymax/widgets/chartbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get dashboardTransactions {
    return List<Map<String, Object>>.generate(7, (index) {
      final workday = DateTime.now().subtract(Duration(days: index));
      double totalAmount = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == workday.day &&
            recentTransactions[i].date.month == workday.month &&
            recentTransactions[i].date.year == workday.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }
      //   print(DateFormat.E().format(workday));
      // print(totalAmount);
      return {
        'day': DateFormat.E().format(workday).toString().substring(0, 1),
        'amount': totalAmount
      };
    }).reversed.toList();
  }

  double get totalExpenses {
    return dashboardTransactions.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element['amount'] as double));
  }

  @override
  Widget build(BuildContext contex) {
    //   print(dashboardTransactions);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: dashboardTransactions
              .map((data) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                        data['day'] as String,
                        data['amount'] as double,
                        totalExpenses == 0.0
                            ? 0.0
                            : (data['amount'] as double) / totalExpenses),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
