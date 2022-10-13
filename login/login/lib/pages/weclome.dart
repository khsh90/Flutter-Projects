import 'package:flutter/material.dart';
import 'package:login/widgets/welcomewidget.dart';

import '../widgets/appdrawer.dart';

class WelcomeApp extends StatelessWidget {
  Widget cutomElevatedButton(
      {required Color btnColor,
      required String btnName,
      required void Function() btnFunction}) {
    return ElevatedButton(
      onPressed: btnFunction,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 45),
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        elevation: 3,
      ),
      child: Text(btnName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My page'),
        ),
        body: const WelcomeWidget(),
        drawer: const AppDrawer(),
      ),
    );
  }
}
