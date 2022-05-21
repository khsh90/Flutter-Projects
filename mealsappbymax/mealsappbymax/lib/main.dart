import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DeliveryApp(),
      title: 'Max DeliveryApp',
    );
  }
}



class DeliveryApp extends StatefulWidget {
  const DeliveryApp({Key? key}) : super(key: key);


  @override
  State<DeliveryApp> createState() => _DeliveryApp();
}

class _DeliveryApp extends State<DeliveryApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliveryApp'),
      ),
      body: const Center(
        child: Text('DeliveryApp'),
      ),
    );
  }
}

