import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _total = 0;

  final questions = const [
    {
      'Question': 'What is your favourite name',
      'Answre': [
        {'text': 'Black', 'score': 5},
        {'text': 'white', 'score': 10},
        {'text': 'Greem', 'score': 35}
      ]
    },
    {
      'Question': 'What is your favourite aniaml',
      'Answre': [
        {'text': 'Dog', 'score': 3},
        {'text': 'Cat', 'score': 15},
        {'text': 'Horse', 'score': 25}
      ]
    },
    {
      'Question': 'What is your favourite Hobbie',
      'Answre': [
        {'text': 'Swimming', 'score': 60},
        {'text': 'Running', 'score': 25},
        {'text': 'Video game', 'score': 30}
      ]
    },
  ];

  void answerQuestions(int score) {
    _total += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  void startAgain() {
    setState(() {
      _questionIndex = 0;
      _total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('MyApp')),
            body: _questionIndex < questions.length
                ? Quiz(
                    questions: questions,
                    questionIndex: _questionIndex,
                    answerQuestions: answerQuestions)
                : Result(_total, startAgain)));
  }
}
