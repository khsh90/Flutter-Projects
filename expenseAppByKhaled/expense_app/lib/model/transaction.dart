import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String item;
  final double amount;
  final DateTime transactionDate;

  Transaction(
      {required this.id,
      required this.item,
      required this.amount,
      required this.transactionDate});
}
