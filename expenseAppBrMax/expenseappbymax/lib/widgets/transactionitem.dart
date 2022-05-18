import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Transactionitem extends StatelessWidget {
  const Transactionitem({
    Key? key,
    required this.transaction,
    required this.removeTX,
  }) : super(key: key);

  final Transaction transaction;
  final Function removeTX;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: FittedBox(
            child: Text(
              '${transaction.amount.toString()}JD',
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        title: Text(
         transaction.title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: const TextStyle(fontSize: 11),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? TextButton.icon(
                onPressed: () => removeTX(transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style: TextButton.styleFrom(
                    primary: Theme.of(context).errorColor))
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => removeTX(transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}