import 'package:intl/intl.dart';

import 'package:expense_app/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: transactions.isEmpty
          ? Center(
              child: Container(child: Image.asset('assets/images/waiting.png')))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(8),
                elevation: 7,
                child: ListTile(
                  leading: Builder(builder: (context) {
                    return CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: FittedBox(
                        child: Column(
                          children: [
                            Text(
                              ' ${transactions[index].amount.toString()}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'JD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      maxRadius: 29,
                    );
                  }),
                  title: Text(
                    transactions[index].item,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd()
                        .format(transactions[index].transactionDate)
                        .toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.delete)),
                ),
              ),
            ),
    );
  }
}
