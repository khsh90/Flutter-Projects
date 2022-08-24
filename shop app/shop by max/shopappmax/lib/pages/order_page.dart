import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappmax/provider/orders.dart';
import 'package:shopappmax/widgets/app_drawer.dart';
import 'package:shopappmax/widgets/orderItemsWidget.dart';

class OrderPage extends StatefulWidget {
  static String route = '/order';

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // if any thing happened in future ,and this will make the rebuild it again you can solve it by below
  // bool isLoading = false;
  var orderData;

  Future orderDataFunction() async {
    await Provider.of<Orders>(context, listen: false).fetchOrder();
  }

  @override
  void initState() {
    orderData = orderDataFunction();
    // Future.delayed(Duration.zero).then((_) async {
    //   setState(() {
    //     isLoading = true;
    //   });
    //   await Provider.of<Orders>(context, listen: false).fetchOrder();
    //   setState(() {
    //     isLoading = false;
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //   final orders = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Page'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: orderData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error occured'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (context, orders, child) => Card(
                    margin: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: orders.orders.length,
                      itemBuilder: (context, eachOrder) => OrdersItemsWidget(
                          orderItems: orders.orders[eachOrder]),
                    ),
                  ),
                );
              }
            }
          },
        ));
  }
}
