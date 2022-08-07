import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappmax/provider/cart.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String productId;

  CartItems(
      {required this.id,
      required this.productId,
      required this.title,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).remiteItem(
          productId,
        );
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          size: 50,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      ),
      key: ValueKey(id),
      child: Card(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.purple,
              child: FittedBox(
                child: Text(
                  '$price',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total:${price * quantity}'),
            trailing: Text('$quantity X'),
          ),
        ),
      ),
    );
  }
}
