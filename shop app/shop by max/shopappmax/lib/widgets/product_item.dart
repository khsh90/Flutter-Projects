import 'package:flutter/material.dart';
import 'package:shopappmax/pages/productitemdetails.dart';
import 'package:provider/provider.dart';
import 'package:shopappmax/provider/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String imageUrl;
  // final String title;

  // ProductItem({required this.id, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
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
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              productData.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_basket,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {},
            ),
            leading: IconButton(
              icon: Icon(
                productData.isFavoirite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                productData.toggleFavorite();
              },
            ),
          ),
        ),
      ),
    );
  }
}
