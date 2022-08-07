import 'package:flutter/material.dart';
import '../provider/productsprovider.dart';
import 'package:provider/provider.dart';

class ProductItemDetials extends StatelessWidget {
  // final String title;
  // ProductItemDetials(this.title);

  static String pageRoute = '/productItemDetials';

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments as String;

    final loadedProduct =
        Provider.of<ProductsProvider>(context, listen: false).findById(id);

    return (Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 350,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${loadedProduct.price} JD',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${loadedProduct.description} ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ));
  }
}
