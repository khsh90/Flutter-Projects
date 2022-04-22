import '../widgets/userTransaction.dart';

import 'models/transaction.dart';
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
            UserTransaction()
          ],
        ));
  }
}
