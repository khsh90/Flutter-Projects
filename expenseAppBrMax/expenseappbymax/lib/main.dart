import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //  MyApp(Key? key):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpenseApp(),
    );
  }
}

class ExpenseApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 20, date: DateTime.now()),
    Transaction(id: 't2', title: 'Bag', amount: 25, date: DateTime.now()),
    Transaction(id: 't3', title: 'Tshirt', amount: 40, date: DateTime.now()),
    Transaction(id: 't4', title: 'Desk', amount: 100, date: DateTime.now()),
    Transaction(id: 't5', title: 'Shirt', amount: 85, date: DateTime.now()),
    Transaction(id: 't6', title: 'Book', amount: 35, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense App'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                child: Text('DashBoard'),
                elevation: 5,
                color: Colors.blue,
              ),
            ),
            Column(
              children: transactions
                  .map((tx) => Card(
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              padding: const EdgeInsets.all(5),
                              child: Text('${tx.amount.toString()} JD'),
                            ),
                            Column(
                              children: [
                                Text(tx.title),
                                Text(tx.date.toString())
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ));
  }
}
