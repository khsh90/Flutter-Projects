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
      print(DateFormat.E().format(workday));
      print(totalAmount);
      return {'day': DateFormat.E().format(workday), 'amount': totalAmount};
    });
  }

  @override
  Widget build(BuildContext contex) {
    print(dashboardTransactions);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(7),
      child: Row(
        children: const [],
      ),
    );
  }
}
