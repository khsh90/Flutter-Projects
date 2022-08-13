import 'package:flutter/cupertino.dart';
import 'package:shopappmax/provider/cart.dart';
import 'package:shopappmax/provider/product.dart';

class OrderItem {
  final String id;
  final DateTime orderDate;
  final double amount;
  final List<CartItem> products;

  OrderItem(
      {required this.id,
      required this.orderDate,
      required this.amount,
      required this.products});
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders => [..._orders];

  void addOrders(List<CartItem> cartItem, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            orderDate: DateTime.now(),
            amount: total,
            products: cartItem));

    notifyListeners();
  }
}
