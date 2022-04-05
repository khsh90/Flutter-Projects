import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback playAgain;
  final String resultValue;

  Result({required this.playAgain, required this.resultValue});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultValue,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(onPressed: playAgain, child: const Text('Play again'))
      ],
    );
  }
}
