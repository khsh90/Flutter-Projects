import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappmax/pages/cartpage.dart';
import 'package:shopappmax/provider/productsprovider.dart';
import 'package:shopappmax/widgets/badge.dart';
import 'package:shopappmax/widgets/app_drawer.dart';
import 'package:shopappmax/widgets/product_item.dart';
import '../provider/cart.dart';
import '../provider/product.dart';
import '../widgets/productgridview.dart';

enum FilterOptions {
  ShowFavorite,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    // Future.delayed(Duration.zero).then((_) =>
    //     Provider.of<ProductsProvider>(context, listen: false).getProducts());

    //the both above works without issue if you make listed false , but we will use better way by using didchange depences

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // don't use asysc await with  didChangeDependencies and initState , use then istead
    // here to be used better than initState , with listen true .
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductsProvider>(context).getProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  bool _showFavoriteItems = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Overview'),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.ShowFavorite) {
                    _showFavoriteItems = true;
                  } else {
                    _showFavoriteItems = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOptions.ShowFavorite,
                      child: Text('Only Favourite'),
                    ),
                    const PopupMenuItem(
                      value: FilterOptions.All,
                      child: Text('All Items'),
                    )
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) =>
                Badge(value: cart.itemCount.toString(), child: ch!),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartPage.route,
                );
              },
            ),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProductGridView(_showFavoriteItems),
      drawer: AppDrawer(),
    );
  }
}
