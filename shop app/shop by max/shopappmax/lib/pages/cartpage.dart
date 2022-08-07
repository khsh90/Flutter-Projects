import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappmax/provider/cart.dart';
import 'package:shopappmax/widgets/cartitems.dart';

class CartPage extends StatelessWidget {
  static String route = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart Items'),
        ),
        body: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              Card(
                elevation: 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          '${cart.cartTotal} JD',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Order Now',
                            style:
                                TextStyle(color: Colors.purple, fontSize: 16),
                          ),
                        )
                      ]),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, i) => CartItems(
                            id: cart.items.values.toList()[i].id,
                            title: cart.items.values.toList()[i].title,
                            price: cart.items.values.toList()[i].price,
                            quantity: cart.items.values.toList()[i].quantity,
                            productId: cart.items.keys.toList()[i],
                          )))
            ],
          ),
        ));
  }
}
