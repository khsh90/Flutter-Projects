import 'package:intl/intl.dart';

import 'package:expense_app/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand'),
                            ),
                            const Text(
                              'JD',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Acme',
                              ),
                            )
                          ],
                        ),
                      ),
                      maxRadius: 29,
                    );
                  }),
                  title: Text(transactions[index].item,
                      style: Theme.of(context).textTheme.headline1),
                  subtitle: Text(
                    DateFormat.yMMMd()
                        .format(transactions[index].transactionDate)
                        .toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  trailing: IconButton(
                      onPressed: () => deleteTx(transactions[index].id),
                      icon: const Icon(
                        Icons.delete,
                      )),
                ),
              ),
            ),
    );
  }
}
