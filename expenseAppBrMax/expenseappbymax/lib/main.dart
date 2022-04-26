import 'dart:ui';

import 'package:expenseappbymax/widgets/chart.dart';
import 'package:expenseappbymax/widgets/newTransaction.dart';
import 'package:expenseappbymax/widgets/transactionList.dart';

import 'package:flutter/material.dart';

import '/models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //  MyApp(Key? key):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ExpenseApp(),
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            fontFamily: 'Quicksand',
            primaryColor: Colors.green,
            primarySwatch: Colors.green,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: Colors.amber, primary: Colors.green)));
  }
}

class ExpenseApp extends StatefulWidget {
  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 20, date: DateTime.now()),
    Transaction(id: 't2', title: 'Bag', amount: 25, date: DateTime.now()),
    Transaction(id: 't3', title: 'Tshirt', amount: 40, date: DateTime.now()),
    Transaction(id: 't4', title: 'Desk', amount: 100, date: DateTime.now()),
    Transaction(id: 't5', title: 'Shirt', amount: 85, date: DateTime.now()),
    Transaction(id: 't6', title: 'Book', amount: 35, date: DateTime.now()),
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

  List<Transaction> get recentTransaction {
    return transactions
        .where((eachTx) => eachTx.date
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  void creatModalSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx, builder: (_) => NewTransaction(addNewTX));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => creatModalSheet(context), icon: Icon(Icons.add))
        ],
        title: const Text(
          'Expense App',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Chart(recentTransaction),
            ),
            TransactionsList(transactions: transactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () => creatModalSheet(context), child: Icon(Icons.add)),
    );
  }
}
