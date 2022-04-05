import 'package:flutter/material.dart';

class Ansnwer extends StatelessWidget {
  final String userInput;
  final VoidCallback indexCounter;

  Ansnwer({required this.userInput, required this.indexCounter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 350,
            child:
                ElevatedButton(onPressed: indexCounter, child: Text(userInput)))
      ],
    );
  }
}
