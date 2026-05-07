import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'ما هو أقرب كوكب للشمس؟',
      'answers': ['عطارد', 'الزهرة', 'الأرض', 'المريخ'],
      'correct': 'عطارد',
    },
    {
      'questionText': 'ما هو أكبر كوكب في المجموعة الشمسية؟',
      'answers': ['زحل', 'المشتري', 'أورانوس', 'نبتون'],
      'correct': 'المشتري',
    },
    {
      'questionText': 'كم عدد كواكب المجموعة الشمسية؟',
      'answers': ['7', '8', '9', '10'],
      'correct': '8',
    },
    {
      'questionText': 'ما هو الكوكب الأحمر؟',
      'answers': ['الأرض', 'المريخ', 'زحل', 'نبتون'],
      'correct': 'المريخ',
    },
  ];

  var _questionIndex = 0;
  var _score = 0;

  void _answerQuestion(String answer) {
    if (answer == _questions[_questionIndex]['correct']) {
      _score++;
    }
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('كويز الفضاء')),
        body: Center(
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_score, _resetQuiz),
        ),
      ),
    );
  }
}
