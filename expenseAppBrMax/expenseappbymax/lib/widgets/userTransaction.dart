import '../widgets/newTransaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transactionList.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 20, date: DateTime.now()),
    Transaction(id: 't2', title: 'Bag', amount: 25, date: DateTime.now()),
    // Transaction(id: 't3', title: 'Tshirt', amount: 40, date: DateTime.now()),
    // Transaction(id: 't4', title: 'Desk', amount: 100, date: DateTime.now()),
    // Transaction(id: 't5', title: 'Shirt', amount: 85, date: DateTime.now()),
    // Transaction(id: 't6', title: 'Book', amount: 35, date: DateTime.now()),
  ];

  void addNewTX(String Newtitle, double Newamount) {
    final newTX = Transaction(
        id: DateTime.now().toString(),
        title: Newtitle,
        amount: Newamount,
        date: DateTime.now());
    setState(() {
      transactions.add(newTX);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewTX),
        TransactionsList(
          transactions: transactions,
        ),
      ],
    );
  }
}
