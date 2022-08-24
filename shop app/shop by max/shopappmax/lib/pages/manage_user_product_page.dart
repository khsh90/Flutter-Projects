import 'package:flutter/material.dart';
import 'package:shopappmax/pages/add_and_edit_prodcut.dart';
import 'package:shopappmax/provider/product.dart';
import 'package:shopappmax/widgets/app_drawer.dart';
import 'package:shopappmax/widgets/manage_user_product_widget.dart';
import '../provider/productsprovider.dart';
import 'package:provider/provider.dart';

class ManageUserProductPage extends StatelessWidget {
  static String route = '/manageUserProduct';

  Future<void> _refrechProducs(BuildContext context) async {
    await Provider.of<ProductsProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final userProduct = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddAndEditProdcutPage.route);
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('User products'),
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refrechProducs(context),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: userProduct.items.length,
            itemBuilder: (_, eachProduct) => Column(
              children: [
                MangeUserProductWidget(
                  title: userProduct.items[eachProduct].title,
                  productImage: userProduct.items[eachProduct].imageUrl,
                  id: userProduct.items[eachProduct].id,
                ),
                const Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
