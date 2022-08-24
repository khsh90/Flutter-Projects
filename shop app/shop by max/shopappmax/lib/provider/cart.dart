// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  int get itemCount => _items.length;

  Map<String, CartItem> get items => {..._items};

  double get cartTotal {
    double total = 0.0;
    _items.forEach((key, eachCartItem) {
      total += eachCartItem.quantity + eachCartItem.price;
    });
    return total;
  }

  void addItem(String productId, String productTitle, double productPrice) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (exixtingItem) => CartItem(
              id: exixtingItem.id,
              title: exixtingItem.title,
              price: exixtingItem.price,
              quantity: exixtingItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: productTitle,
              price: productPrice,
              quantity: 1));
    }
    notifyListeners();
  }

  void remiteItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }

  void removeSigleItem(String productId) {
    if (!_items.containsValue([productId])) {
      return;
    }

    if ((_items[productId]?.quantity)! < 1) {
      _items.update(
          productId,
          (exisitedItem) => CartItem(
              id: exisitedItem.id,
              title: exisitedItem.title,
              price: exisitedItem.price,
              quantity: exisitedItem.quantity - 1));
    } else {
      _items.remove(productId);
    }

    notifyListeners();
  }
}
