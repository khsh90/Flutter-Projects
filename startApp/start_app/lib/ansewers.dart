import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback callBack;
  final String answerQuesiton;

  Answer(this.callBack, this.answerQuesiton);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(onPressed: callBack, child: Text(answerQuesiton)),
    );
  }
}
