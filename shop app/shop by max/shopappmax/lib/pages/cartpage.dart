import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappmax/pages/order_page.dart';
import 'package:shopappmax/provider/cart.dart';
import 'package:shopappmax/provider/orders.dart';
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
                          '${cart.cartTotal.toStringAsFixed(2)} JD',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        OrderNowWidget(cart: cart)
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

class OrderNowWidget extends StatefulWidget {
  const OrderNowWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderNowWidget> createState() => _OrderNowWidgetState();
}

class _OrderNowWidgetState extends State<OrderNowWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: isLoading
          ? const CircularProgressIndicator()
          : const Text(
              'Order Now',
              style: TextStyle(color: Colors.purple, fontSize: 16),
            ),
      onPressed: () async {
        if (widget.cart.cartTotal <= 0 || isLoading) {
          return;
        } else {
          setState(() {
            isLoading = true;
          });
          await Provider.of<Orders>(context, listen: false).addOrders(
              widget.cart.items.values.toList(), widget.cart.cartTotal);
          Navigator.of(context).pushNamed(OrderPage.route);
          setState(() {
            isLoading = false;
          });

          widget.cart.clearCart();
        }
      },
    );
  }
}
