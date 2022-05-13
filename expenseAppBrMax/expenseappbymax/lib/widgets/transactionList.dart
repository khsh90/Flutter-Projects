import 'package:expenseappbymax/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              itemCount: transactions.length,
              itemBuilder: (ctx, tx) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Text(
                          '${transactions[tx].amount.toString()}JD',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[tx].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[tx].date),
                      style: const TextStyle(fontSize: 11),
                    ),
                    trailing: MediaQuery.of(context).size.width > 450
                        ? TextButton.icon(
                            onPressed: () => removeTX(transactions[tx].id),
                            icon: const Icon(Icons.delete),
                            label: const Text('Delete'),
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).errorColor))
                        : IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => removeTX(transactions[tx].id),
                            color: Theme.of(context).errorColor,
                          ),
                  ),
                );
              },
            ),
    );
  }
}
