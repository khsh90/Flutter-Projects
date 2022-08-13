import 'package:flutter/material.dart';
import 'package:shopappmax/pages/productitemdetails.dart';
import 'package:provider/provider.dart';
import '/provider/cart.dart';
import 'package:shopappmax/provider/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String imageUrl;
  // final String title;

  // ProductItem({required this.id, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              productData.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                cart.addItem(
                    productData.id, productData.title, productData.price);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Items has beed aded'),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () => cart.removeSigleItem(productData.id),
                  ),
                ));
              },
            ),
            leading: Consumer<Product>(
              //here we use consumer becuase we need to favorite only to be changed no all the widget this will enchance the performance
              builder: (context, value, child) => IconButton(
                icon: Icon(
                    productData.isFavoirite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.amber),
                onPressed: () {
                  productData.toggleFavorite();
                },
              ),
            ),
          ),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
                ProductItemDetials.pageRoute,
                arguments: productData.id)
            //       builder: (context) => ProductItemDetials(),
            //     )))

            ,
            child: Image.network(
              productData.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
