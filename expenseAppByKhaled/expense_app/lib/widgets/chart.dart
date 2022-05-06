import 'package:expense_app/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);
  List<Map<String, Object>> get chartData {
    return List.generate(7, (index) {
      var workDay = DateTime.now().subtract(Duration(days: index));

      var formatedDateTime =
          DateFormat().add_E().format(workDay).substring(0, 1);

      double totalPerDay = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].transactionDate.day == workDay.day &&
            recentTransaction[i].transactionDate.month == workDay.month &&
            recentTransaction[i].transactionDate.year == workDay.year) {
          totalPerDay += recentTransaction[i].amount;
        }
      }

      return {'day': formatedDateTime, 'amount': totalPerDay};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(20),
        elevation: 5,
        child: Row(
          children: chartData
              .map((tx) => Text('${tx['day']}:${tx['amount']}'))
              .toList(),
        ));
  }
}
