class DataFile {
  List<Map<String, Object>> userQuestion() {
    var questions = [
      {
        'question': 'What is your favourite sport',
        'answer': [
          {'type': 'swimming', 'score': 10},
          {'type': 'running', 'score': 20},
          {'type': 'video Game', 'score': 30}
        ]
      },
      {
        'question': 'What is your favourate animal',
        'answer': [
          {'type': 'cat', 'score': 10},
          {'type': 'dog', 'score': 20},
          {'type': 'gorse', 'score': 30},
        ]
      },
      {
        'question': 'what is your favourite color',
        'answer': [
          {'type': 'balck', 'score': 10},
          {'type': 'white', 'score': 20},
          {'type': 'green', 'score': 30},
        ],
      },
    ];

    return questions;
  }
}
