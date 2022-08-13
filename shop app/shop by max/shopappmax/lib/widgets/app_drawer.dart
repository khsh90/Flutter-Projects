import 'package:flutter/material.dart';
import 'package:shopappmax/pages/manage_user_product_page.dart';
import 'package:shopappmax/pages/order_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Hello Freind'),
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          const SizedBox(
            height: 6,
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(OrderPage.route),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage Prodcut'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ManageUserProductPage.route),
          ),
        ],
      ),
    );
  }
}
