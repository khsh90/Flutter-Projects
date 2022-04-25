import 'package:expenseappbymax/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No data loaded yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    '/assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          '${transactions[tx].amount.toStringAsFixed(2)} JD',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 16),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transactions[tx].title,
                              style: Theme.of(context).textTheme.headline6),
                          Text(
                            DateFormat()
                                .add_yMMMd()
                                .format(transactions[tx].date),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 11),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}