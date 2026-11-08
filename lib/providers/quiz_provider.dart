import 'package:flutter/material.dart';

import '../models/question.dart';

class QuizProvider extends ChangeNotifier {
  String userName = '';

  int currentQuestion = 0;

  final Map<int, int> answers = {};

  List<Question> get questions => quizQuestions;

  int get totalQuestions => questions.length;

  int get score {
    int correct = 0;

    answers.forEach((index, answer) {
      if (answer == questions[index].correctAnswer) {
        correct++;
      }
    });

    return correct;
  }

  int get wrongAnswers => answers.length - score;

  double get progress => answers.length / totalQuestions;

  void setName(String name) {
    userName = name;
    notifyListeners();
  }

  void selectAnswer(int answer) {
    answers[currentQuestion] = answer;
    notifyListeners();
  }

  int? get selectedAnswer => answers[currentQuestion];

  bool get isLastQuestion => currentQuestion == totalQuestions - 1;

  void nextQuestion() {
    if (currentQuestion < totalQuestions - 1) {
      currentQuestion++;
      notifyListeners();
    }
  }

  void resetQuiz() {
    currentQuestion = 0;
    answers.clear();
    userName = '';
    notifyListeners();
  }
}
