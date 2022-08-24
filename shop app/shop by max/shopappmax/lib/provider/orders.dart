import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopappmax/provider/cart.dart';
import 'package:shopappmax/provider/product.dart';
import 'package:http/http.dart' as http;

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
  List<OrderItem> _orders = [];

  List<OrderItem> get orders => [..._orders];

  Future<void> fetchOrder() async {
    final url = Uri.parse(
        'https://flutter-shop-app-862c6-default-rtdb.firebaseio.com/orders.json');
    final List<OrderItem> loadedOrders = [];
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //  print(json.decode(response.body));

    extractedData.forEach((key, value) {
      loadedOrders.add(OrderItem(
          id: key,
          orderDate: DateTime.parse(value['orderDate']),
          amount: value['amount'],
          products: (value['products'] as List<dynamic>)
              .map((eachCartItem) => CartItem(
                  id: eachCartItem['id'],
                  title: eachCartItem['title'],
                  price: eachCartItem['price'],
                  quantity: eachCartItem['quantity']))
              .toList()
              .reversed
              .toList()));
    });
    _orders = loadedOrders;
    notifyListeners();
  }

  Future<void> addOrders(List<CartItem> cartItem, double total) async {
    final timeStamp = DateTime.now();
    final url = Uri.parse(
        'https://flutter-shop-app-862c6-default-rtdb.firebaseio.com/orders.json');

    final response = await http.post(url,
        body: json.encode({
          'orderDate': timeStamp.toIso8601String(),
          'amount': total,
          'products': cartItem
              .map((eachCartItem) => {
                    'id': eachCartItem.id,
                    'title': eachCartItem.title,
                    'price': eachCartItem.price,
                    'quantity': eachCartItem.quantity,
                  })
              .toList(),
        }));

    _orders.insert(
        0,
        OrderItem(
            id: json.decode(response.body)['name'],
            orderDate: timeStamp,
            amount: total,
            products: cartItem));

    notifyListeners();
  }
}
