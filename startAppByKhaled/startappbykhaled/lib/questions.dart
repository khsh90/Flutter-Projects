import 'package:flutter/material.dart';
import 'package:startappbykhaled/result.dart';

import './dataFile.dart';
import './answers.dart';

class Questions extends StatelessWidget {
  final int listIndex;
  List<Map<String, Object>> qus;
  Questions({required this.listIndex, required this.qus});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(qus[listIndex]['question'].toString(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)));
  }
}
