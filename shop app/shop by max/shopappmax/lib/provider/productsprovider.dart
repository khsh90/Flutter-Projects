import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopappmax/models/httpexception.dart';
import 'package:shopappmax/widgets/product_item.dart';

import 'package:http/http.dart' as http;
import 'product.dart';

import 'product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];

  List<Product> get items => [..._items];

  Product findById(String id) {
    return _items.firstWhere((eahcProduct) => eahcProduct.id == id);
  }

  Future<void> getProducts() async {
    final url = Uri.parse(
        'https://flutter-shop-app-862c6-default-rtdb.firebaseio.com/products.json');

    try {
      final response = await http.get(url);
      List<Product> loadedProducts = [];

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
   
      extractedData.forEach((prodId, prdData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prdData['title'],
          description: prdData['description'],
          price: prdData['price'],
          imageUrl: prdData['imageUrl'],
          isFavoirite: prdData['isFavoirite'],
        ));
        _items = loadedProducts;
      });
      notifyListeners();

      // print(extractedData);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addProduct(Product productData) async {
    final url = Uri.parse(
        'https://flutter-shop-app-862c6-default-rtdb.firebaseio.com/products.json');
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': productData.title,
            'description': productData.description,
            'price': productData.price,
            'imageUrl': productData.imageUrl,
            'isFavoirite': productData.isFavoirite
          }));
      print(json.decode(response.body));
      final newProduct = Product(
          id: json.decode(response.body)['name'],
          // id: DateTime.now().toString(),
          title: productData.title,
          description: productData.description,
          price: productData.price,
          imageUrl: productData.imageUrl);
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      // throw error; or just rethrow
      rethrow;

      //this will throw the error on add_and_edit_product.dart in adding function.

    }
  }

  Future<void> updateProduct(var id, Product newProduct) async {
    try {
      final prodcutIndex = _items.indexWhere((eachProd) => eachProd.id == id);
      final url = Uri.parse(
          'https://flutter-shop-app-862c6-default-rtdb.firebaseio.com/products/$id.json');

      if (prodcutIndex >= 0) {
        await http.patch(url,
            body: json.encode({
              'title': newProduct.title,
              'description': newProduct.description,
              'price': newProduct.price.toString(),
              'imageUrl': newProduct.imageUrl,
            }));
        _items[prodcutIndex] = newProduct;
        notifyListeners();
      } else {
        print('nothing happened');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> removeProduct(String prodId) async {
    final url = Uri.parse(
        'https://flutter-shop-app-862c6-default-rtdb.firebaseio.com/products/$prodId.json');
    final exititedProductIndex =
        _items.indexWhere((eachItem) => eachItem.id == prodId);

    final extitedProduct = items[exititedProductIndex];
    _items.removeAt(exititedProductIndex);
    notifyListeners();

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      _items.insert(exititedProductIndex, extitedProduct);
      notifyListeners();
      throw CustomHttpException('The item could not be deleteted');
    }
  }

  List<Product> get favoriteItem =>
      _items.where((eachItem) => eachItem.isFavoirite).toList();
}
