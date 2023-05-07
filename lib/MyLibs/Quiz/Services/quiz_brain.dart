import 'questions.dart';

class QuizBrain {
  QuizBrain() {
    init();
  }

  int currentQuestion = 0;
  List questions = [];

  init() {
    questions.add(Question('Cat sound is meow?', false));
    questions.add(Question('Dog sound is gauw?', false));
    questions.add(Question('Cown sound is meow?', false));
  }

  nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      currentQuestion++;
    }
  }

  getQuestion() {
    return questions[currentQuestion];
  }
}
