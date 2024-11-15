import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/pages/home_page.dart';
import 'package:quiz_app_flutter/pages/question_screen.dart';
import '../components/questions.dart';
import 'package:quiz_app_flutter/pages/result_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswers(String answer) {
    setState(() {
      selectedAnswers.add(answer);

      if (selectedAnswers.length == questions.length) {
        activeScreen = 'result-screen';
      }
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomePage(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswers);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        onRestartQuiz: restartQuiz,
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: screenWidget,
      ),
    );
  }
}
