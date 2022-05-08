import '../widgets/chart.dart';

import '../model/transaction.dart';
import '../widgets/titleandamountwidget.dart';
import '../widgets/transactionList.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Acme',
          primaryColor: Colors.green,
          appBarTheme: const AppBarTheme(
              color: Colors.green,
              titleTextStyle: TextStyle(
                  fontFamily: 'Acme',
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.green,
          )),
      home: ExpneseApp(),
    );
  }
}

class ExpneseApp extends StatefulWidget {
  @override
  State<ExpneseApp> createState() => _ExpenseApp();
}

final List<Transaction> transactions = [
  Transaction(
      id: 'd1', item: 'Shoes', amount: 20, transactionDate: DateTime.now())
];

class _ExpenseApp extends State<ExpneseApp> {
  void addTX(String title, double amount, DateTime pickedDateTime) {
    setState(() {
      transactions.add(Transaction(
          id: DateTime.now().toString(),
          item: title,
          amount: amount,
          transactionDate: pickedDateTime));
    });
  }

  void deleteTx(String id) {
    setState(() {
      transactions.removeWhere((txId) => txId.id == id);
    });
  }

  void showModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => TitleAndAmountWidget(addTX),
    );
  }

  List<Transaction> get _recentTransaction {
    return transactions
        .where((tx) => tx.transactionDate
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => showModal(context),
              icon: const Icon(
                Icons.add,
                size: 27,
              ))
        ],
        title: const Text('Expense App ((Khaled))'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_recentTransaction),
            TransactionList(transactions, deleteTx),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModal(context),
        elevation: 5,
        child: const Icon(Icons.add, size: 27),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
