import 'package:expense_app/model/transaction.dart';
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
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                size: 27,
              ))
        ],
        title: const Text('Expense App ((Khaled))'),
      ),
      body: Column(
        children: [
          Text('DashBoard'),
          TransactionList(transactions),
          TitleAndAmountWidget(),

          // ListView.builder(itemBuilder: ((context, index) => ListTile()))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 5,
        child: const Icon(Icons.add, size: 27),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
