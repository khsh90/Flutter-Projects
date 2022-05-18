import 'dart:io'; //used for platfrom
import 'package:expenseappbymax/widgets/chart.dart';
import 'package:expenseappbymax/widgets/newTransaction.dart';
import 'package:expenseappbymax/widgets/transactionList.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/models/transaction.dart';

void main() {
  //the below two lines to make the app only on portrait
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

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

  void addNewTX(String Newtitle, double Newamount, DateTime choosenDate) {
    final newTX = Transaction(
        id: DateTime.now().toString(),
        title: Newtitle,
        amount: Newamount,
        date: choosenDate);
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

  void removeTx(String id) {
    setState(() {
      transactions.removeWhere((tx) => tx.id == id);
    });
  }

  bool _switchValue = false;

  Widget inLandScapMode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Show Chart',
          style: TextStyle(fontSize: 10),
        ),
        Switch.adaptive(
            activeColor: Colors.amber,
            // it will use the style for each soutable platform id ios or android or another
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            }),
      ],
    );
  }

  Widget portraitMode(MediaQueryData mediaQuery, AppBar appBr) {
    return Container(
      //please note that max and default size for media quiry is 1 so below we devied it to .3 abd .7
      height: (mediaQuery.size.height -
              appBr.preferredSize.height -
              mediaQuery.padding.top) *
          .3,
      width: double.infinity,
      child: Chart(recentTransaction),
    );
  }

  Widget windowsMode(MediaQueryData mediaQuery, AppBar appBr) {
    return Container(
      //please note that max and default size for media quiry is 1 so below we devied it to .3 abd .7
      height: (mediaQuery.size.height -
              appBr.preferredSize.height -
              mediaQuery.padding.top) *
          .6,
      width: double.infinity,
      child: Chart(recentTransaction),
    );
  }

  Widget switchTriggered(
      MediaQueryData mediaQuery, AppBar appBr, Widget txList) {
    return _switchValue
        ? Container(
            //please note that max and default size for media quiry is 1 so below we devied it to .3 abd .7
            height: (mediaQuery.size.height -
                    appBr.preferredSize.height -
                    mediaQuery.padding.top) *
                .6,
            width: double.infinity,
            child: Chart(recentTransaction),
          )
        : txList;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final isLandedMode = mediaQuery.orientation == Orientation.landscape;
    final appBr = AppBar(
      actions: [
        IconButton(
            onPressed: () => creatModalSheet(context), icon: Icon(Icons.add))
      ],
      title: const Text(
        'Expense App',
      ),
    );

    final txList = Container(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height -
              appBr.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          .7,
      child: TransactionsList(
        transactions: transactions,
        removeTX: removeTx,
      ),
    );
    final mainBody = SafeArea(
        // safe area will be used here for iphone to stay away from botom of screen and the top navigation bar
        child: SingleChildScrollView(
      child: Column(
        children: [
          if (isLandedMode && !Platform.isWindows) inLandScapMode(),
          if (!isLandedMode) portraitMode(mediaQuery, appBr),
          if (Platform.isWindows) windowsMode(mediaQuery, appBr),
          switchTriggered(mediaQuery, appBr, txList)
          // ------
        ],
      ),
    ));

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: const Text(
                'Expense App',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    // gesture detector used here to allow us to used our own button that will be soutable for iphone
                    onTap: () => creatModalSheet(context),
                    child: const Icon(CupertinoIcons.add),
                  ),
                ],
              ),
            ),
            child: mainBody,
          )
        : Scaffold(
            appBar: appBr,
            body: mainBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isWindows
                ? Container()
                : FloatingActionButton(
                    onPressed: () => creatModalSheet(context),
                    child: const Icon(Icons.add)),
          );
  }
}
