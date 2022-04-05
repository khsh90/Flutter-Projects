import 'package:flutter/material.dart';
import 'package:startappbykhaled/answers.dart';
import './result.dart';
import './questions.dart';
import 'dataFile.dart';

void main() {
  runApp(MyApp());
}

var userData = DataFile();
var questions = userData.userQuestion();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _listIndex = 0;
  int _total = 0;

  void _listIndexCounter(String score) {
    var intScore = 0;
    setState(() {
      _listIndex += 1;
      if (score.isNotEmpty) {
        var intScore = int.tryParse(score);

        if (intScore != null) {
          _total += intScore;
          print(_total);
        }
      }
    });
  }

  void resetCounter() {
    setState(() {
      _listIndex = 0;
      _total = 0;
    });
  }

  String get finalResult {
    String resultName;
    if (_total <= 30) {
      resultName = 'You are Strange';
    } else if (_total > 31 && _total <= 61) {
      resultName = 'You are good';
    } else {
      resultName = 'you are optimistic';
    }

    return resultName;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My App',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Surveillance'),
            ),
            body: _listIndex < questions.length
                ? Column(
                    children: [
                      Questions(listIndex: _listIndex, qus: questions),
                      ...((questions[_listIndex]['answer'])
                              as List<Map<String, Object>>)
                          .map((answer) => Ansnwer(
                              userInput: answer['type'].toString(),
                              indexCounter: () => _listIndexCounter(
                                  answer['score'].toString())))
                    ],
                  )
                : Result(
                    playAgain: resetCounter,
                    resultValue: 'You did it , Your are $finalResult',
                  )));
  }
}
