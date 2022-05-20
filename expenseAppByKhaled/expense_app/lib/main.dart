import 'package:flutter/foundation.dart';

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
  State<ExpneseApp> createState() {
    // print('Main State');
    return _ExpenseApp();
  }
}

final List<Transaction> transactions = [
  // Transaction(
  //     id: 'd1', item: 'Shoes', amount: 20, transactionDate: DateTime.now())
];

class _ExpenseApp extends State<ExpneseApp> with WidgetsBindingObserver {
  @override
  void initState() {
    print('initState');

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   print(state);
  //   super.didChangeAppLifecycleState(state);
  // }

  // @override
  // void didChangeDependencies() {
  //   print('Did change');
  //   super.didChangeDependencies();
  // }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);

  //   print('Dispose');
  //   super.dispose();
  // }

  bool showChart = false;
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
    print('main app state build');
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
    final mediaQ = MediaQuery.of(context);
    var isLandedScope = mediaQ.orientation == Orientation.landscape;

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
            if (isLandedScope)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Show chart'),
                  Switch(
                      activeColor: Theme.of(context).primaryColor,
                      value: showChart,
                      onChanged: (val) {
                        setState(() {
                          showChart = val;
                        });
                      })
                ],
              ),
            if (!isLandedScope) Chart(_recentTransaction),
            if (!isLandedScope) TransactionList(transactions, deleteTx),
            if (isLandedScope)
              showChart
                  ? Chart(_recentTransaction)
                  : TransactionList(transactions, deleteTx),
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
