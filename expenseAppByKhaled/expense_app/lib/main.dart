import 'package:expense_app/model/transaction.dart';
import 'package:expense_app/widgets/transactionList.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      id: DateTime.now().toString(),
      item: 'Shoes',
      amount: 20.99,
      transactionDate: DateTime.now()),
  Transaction(
      id: DateTime.now().toString(),
      item: 'Bag',
      amount: 60.99,
      transactionDate: DateTime.now()),
  Transaction(
      id: DateTime.now().toString(),
      item: 'Tshirt',
      amount: 80.99,
      transactionDate: DateTime.now()),
  Transaction(
      id: DateTime.now().toString(),
      item: 'House Need',
      amount: 150,
      transactionDate: DateTime.now()),
];

class _ExpenseApp extends State<ExpneseApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense App ((Khaled))'),
        ),
        body: Column(
          children: [
            Text('DashBoard'),
            ListView.builder(itemBuilder: ((context, index) => ListTile()))
          
          
          
          
          ],
        ));
  }
}
