import 'package:expenseappbymax/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map((tx) => Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2)),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        '${tx.amount.toString()} JD',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 16),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat().add_yMMMd().format(tx.date),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 11),
                        )
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
