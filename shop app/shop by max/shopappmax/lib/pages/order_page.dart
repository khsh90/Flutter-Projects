import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappmax/provider/orders.dart';
import 'package:shopappmax/widgets/app_drawer.dart';
import 'package:shopappmax/widgets/orderItemsWidget.dart';

class OrderPage extends StatelessWidget {
  static String route = '/order';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
      ),
      drawer: AppDrawer(),
      body: Card(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: orders.orders.length,
          itemBuilder: (context, eachOrder) =>
              OrdersItemsWidget(orderItems: orders.orders[eachOrder]),
        ),
      ),
    );
  }
}
