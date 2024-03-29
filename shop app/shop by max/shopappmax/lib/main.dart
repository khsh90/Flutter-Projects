import 'package:flutter/material.dart';
import 'package:shopappmax/pages/add_and_edit_prodcut.dart';
import 'package:shopappmax/pages/cartpage.dart';
import 'package:shopappmax/pages/manage_user_product_page.dart';
import 'package:shopappmax/pages/order_page.dart';
import 'package:shopappmax/pages/productitemdetails.dart';
import 'package:shopappmax/provider/orders.dart';
import 'package:shopappmax/provider/productsprovider.dart';
import './pages/product_overview_page.dart';
import 'package:provider/provider.dart';
import './provider/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Colors.purple),
            fontFamily: 'Lato',
            primaryColor: Colors.green,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.amber)),
        home: ProductOverviewScreen(),
        routes: {
          ProductItemDetials.pageRoute: (context) => ProductItemDetials(),
          CartPage.route: (context) => const CartPage(),
          OrderPage.route: (context) => OrderPage(),
          ManageUserProductPage.route: ((context) => ManageUserProductPage()),
          AddAndEditProdcutPage.route: (context) => AddAndEditProdcutPage(),
        },
      ),
    );
  }
}
