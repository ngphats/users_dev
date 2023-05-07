import 'package:flutter/material.dart';
import 'package:user_dev/MyLibs/Quiz/Services/questions.dart';
import '../Services/quiz_brain.dart';

class QuizBodyWidget extends StatefulWidget {
  const QuizBodyWidget({super.key});

  @override
  State<QuizBodyWidget> createState() => _QuizBodyWidgetState();
}

class _QuizBodyWidgetState extends State<QuizBodyWidget> {
  List<Icon> scoreKeeper = [];

  late QuizBrain quizBrain;
  late Question currentQuestion;

  _QuizBodyWidgetState() {
    quizBrain = QuizBrain();
    currentQuestion = quizBrain.getQuestion();
  }

  void checkUserAnswer(bool answer) {
    setState(() {
      if (currentQuestion.questionAnswer == answer) {
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      quizBrain.nextQuestion();
      currentQuestion = quizBrain.getQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  currentQuestion.questionText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  checkUserAnswer(true);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  checkUserAnswer(false);
                },
                child: const Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: scoreKeeper,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
