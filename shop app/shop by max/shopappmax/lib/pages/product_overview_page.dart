import 'package:flutter/material.dart';
import 'package:shopappmax/widgets/product_item.dart';
import '../provider/product.dart';
import '../widgets/productgridview.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Product Overview')),
        body: ProductGridView());
  }
}
