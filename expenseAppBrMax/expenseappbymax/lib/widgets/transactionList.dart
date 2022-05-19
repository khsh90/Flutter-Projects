import 'package:expenseappbymax/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/transactionitem.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTX;

  TransactionsList({required this.transactions, required this.removeTX});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * .10,
                  ),
                  Text(
                    'No data loaded yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Container(
                    height: constraints.maxHeight * .5,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
            //here we used key becaue color will be change so make the key based on id
              itemCount: transactions.length,
              itemBuilder: (ctx, tx) {
                return Transactionitem(
                  transaction: transactions[tx],
                  removeTX: removeTX,
                  key: ValueKey(transactions[tx].id),
                );
              },
            ),
    );
  }
}
