import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopappmax/provider/orders.dart';
import 'package:intl/intl.dart';

class OrdersItemsWidget extends StatefulWidget {
  final OrderItem orderItems;

  OrdersItemsWidget({required this.orderItems});

  @override
  State<OrdersItemsWidget> createState() => _OrdersItemsWidgetState();
}

class _OrdersItemsWidgetState extends State<OrdersItemsWidget> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListTile(
            title: Text('${widget.orderItems.amount} JD'),
            subtitle: Text(
                '${DateFormat('dd/MM/yyyy hh:mm').format(widget.orderItems.orderDate)}'),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: _expanded
                    ? const Icon(Icons.expand_less)
                    : const Icon(Icons.expand_more)),
          ),
        ),
        if (_expanded)
          SizedBox(
            height: min(widget.orderItems.products.length * 20 + 10, 100.0),
            child: ListView(
              children: widget.orderItems.products
                  .map((eachProduct) => Row(
                        children: [
                          Text(eachProduct.title),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                              '${eachProduct.quantity} X ${eachProduct.price}JD')
                        ],
                      ))
                  .toList(),
            ),
          )
      ],
    );
  }
}
