import 'package:flutter/material.dart';
import 'package:shopappmax/widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../provider/productsprovider.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final producItem = productData.items;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, eachItem) => ChangeNotifierProvider(
        create: (context) => producItem[eachItem],
        child: ProductItem(
            // id: producItem[eachItem].id,
            // imageUrl: producItem[eachItem].imageUrl,
            // title: producItem[eachItem].title

            ),
      ),
      itemCount: producItem.length,
    );
  }
}
