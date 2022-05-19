import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Transactionitem extends StatefulWidget {
  const Transactionitem({
    Key? key,
    required this.transaction,
    required this.removeTX,
  }) : super(key: key);

  final Transaction transaction;
  final Function removeTX;

  @override
  State<Transactionitem> createState() => _TransactionitemState();
}

class _TransactionitemState extends State<Transactionitem> {
  var colors = [Colors.yellow, Colors.purple, Colors.blue, Colors.black];
  var _bgColor;
  @override
  void initState() {
    print('initState');
    _bgColor = colors[Random().nextInt(3)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: FittedBox(
            child: Text(
              '${widget.transaction.amount.toString()}JD',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
          style: const TextStyle(fontSize: 11),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? TextButton.icon(
                onPressed: () => widget.removeTX(widget.transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style:
                    TextButton.styleFrom(primary: Theme.of(context).errorColor))
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => widget.removeTX(widget.transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
