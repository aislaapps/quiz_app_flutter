import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyClassStateful());
}

class MyClassStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyClassStateful> {
  var _questionIndex = 0;
  var _totalScore = 0;
  // in order for afunciton not to be executed yet
  // call it without a parenthesis eg:
  //         RaisedButton(
  //           child: Text('Answer 1'),
  //           onPressed: _answerQuestion,
  //         )
  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('answer question1 pressed');
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    // this is dart calls Maps in Lists
    var questions = [
      {
        'questionText': 'What\'s your favourite colour?',
        'answers': [
          {'text': 'Black', 'score': 1},
          {'text': 'Blue', 'score': 2},
          {'text': 'Pink', 'score': 5},
          {'text': 'Green', 'score': 6},
        ]
      },
      {
        'questionText': 'What\'s your favourite book?',
        'answers': [
          {'text': 'Harry Potter', 'score': 4},
          {'text': 'Weirdo Anh Doh', 'score': 3},
          {'text': 'Captain', 'score': 2},
          {'text': 'Pants', 'score': 1},
        ]
      },
      {
        'questionText': 'What\'s your favourite instructor?',
        'answers': [
          {'text': 'You', 'score': 5},
          {'text': 'Me', 'score': 2},
          {'text': 'Them', 'score': 1},
          {'text': 'They', 'score': 0},
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello My First App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
