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
      height: 380,
      child: transactions.isEmpty
          ? Container(
              width: 350,
              height: 150,
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'No data loaded yet',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 150,
                      child: Image.asset('assets/images/waiting.png'))
                ],
              ))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) => LayoutBuilder(
                    builder: (context, constraints) => Card(
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
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        trailing: constraints.maxWidth > 500
                            ? TextButton.icon(
                                onPressed: () =>
                                    deleteTx(transactions[index].id),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                label: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Theme.of(context).errorColor),
                                ))
                            : IconButton(
                                onPressed: () =>
                                    deleteTx(transactions[index].id),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                      ),
                    ),
                  )),
    );
  }
}
