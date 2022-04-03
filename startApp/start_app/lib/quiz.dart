import 'package:flutter/material.dart';
import './questions.dart';
import './ansewers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestions;

  Quiz(
      {required this.questions,
      required this.questionIndex,
      required this.answerQuestions});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['Question'].toString()),
        ...(questions[questionIndex]['Answre'] as List<Map<String, Object>>)
            .map((answer) => Answer(() => answerQuestions(answer['score']),
                answer['text'].toString()))
            .toList(),
      ],
    );
  }
}
