import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final VoidCallback resetApp;

  Result(this.finalScore, this.resetApp);

  String get finalResult {
    String result = '';

    if (finalScore <= 40) {
      result = 'You are fantastic';
    } else if (finalScore >= 41 && finalScore <= 90) {
      result = 'You are bad';
    } else {
      result = 'You are strange';
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You did it,$finalResult',
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        TextButton(onPressed: resetApp, child: const Text('Start again'))
      ],
    );
  }
}
