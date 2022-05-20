import 'dart:math';

import 'package:expense_app/main.dart';
import 'package:intl/intl.dart';

import 'package:expense_app/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final colors = [Colors.red, Colors.green, Colors.yellow];

  var bgColor;

  @override
  void initState() {
    print(colors[Random().nextInt(3)]);
    print('inistate transaction');
    bgColor = colors[Random().nextInt(3)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('Transaction List');
    return Container(
      height: 380,
      child: widget.transactions.isEmpty
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
              itemCount: widget.transactions.length,
              itemBuilder: (context, index) => LayoutBuilder(
                    builder: (context, constraints) => Card(
                      //  key: ValueKey(transactions[index].id),
                      margin: const EdgeInsets.all(8),
                      elevation: 7,
                      child: ListTile(
                        leading: Builder(builder: (context) {
                          return CircleAvatar(
                            backgroundColor: bgColor,
                            child: FittedBox(
                              child: Column(
                                children: [
                                  Text(
                                    ' ${widget.transactions[index].amount.toString()}',
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
                        title: Text(widget.transactions[index].item,
                            style: Theme.of(context).textTheme.headline1),
                        subtitle: Text(
                          DateFormat.yMMMd()
                              .format(
                                  widget.transactions[index].transactionDate)
                              .toString(),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        trailing: constraints.maxWidth > 500
                            ? TextButton.icon(
                                onPressed: () => widget
                                    .deleteTx(widget.transactions[index].id),
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
                                onPressed: () => widget
                                    .deleteTx(widget.transactions[index].id),
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
