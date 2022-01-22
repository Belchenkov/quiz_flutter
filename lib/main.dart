import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        { 'text': 'Black', 'score': 10 },
        { 'text': 'Red', 'score': 5 },
        { 'text': 'Green', 'score': 3 },
        { 'text': 'White', 'score': 1 },
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        { 'text': 'Rabbit', 'score': 9 },
        { 'text': 'Snake', 'score': 3 },
        { 'text': 'Elephant', 'score': 5 },
        { 'text': 'Lion', 'score': 6 },
      ],
    },
    {
      'questionText': 'What is your favorite programming language?',
      'answers': [
        { 'text': 'JavaScript', 'score': 10 },
        { 'text': 'PHP', 'score': 9 },
        { 'text': 'Python', 'score': 3 },
        { 'text': 'Dart', 'score': 4 },
     ],
    }
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex
            )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

