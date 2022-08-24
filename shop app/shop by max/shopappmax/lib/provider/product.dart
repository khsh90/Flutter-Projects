import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopappmax/models/httpexception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavoirite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavoirite = false});

  Future<void> toggleFavorite() async {
    void favouriteValue(bool oldFavoirite) {
      isFavoirite = oldFavoirite;
      notifyListeners();
    }

    var oldFavoirite = isFavoirite;

    try {
      isFavoirite = !isFavoirite;
      notifyListeners();
      final url = Uri.parse(
          'https://flutter-shop-app-862c6-default-rtdb.firebaseio.com/products/$id.json');

      final response = await http.patch(url,
          body: json.encode({'isFavoirite': isFavoirite}));

      if (response.statusCode >= 400) {
        favouriteValue(oldFavoirite);
        throw CustomHttpException('Something Went wrong');
      }
    } catch (error) {
      favouriteValue(oldFavoirite);
      throw CustomHttpException('Something Went wrong');
    }
  }
}
