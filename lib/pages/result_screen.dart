import 'package:flutter/material.dart';
import '../components/common.dart';
import '../components/questions.dart';
import 'package:quiz_app_flutter/components/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.onRestartQuiz,
    required this.chosenAnswers,
  });

  final void Function() onRestartQuiz;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[0],
        'chosenAnswer': chosenAnswers[i],
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = getSummaryData().where((data) {
      return data['correctAnswer'] == data['chosenAnswer'];
    }).length;

    return Scaffold(
      body: Container(
        decoration: bodyDecor,
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 171, 170, 230),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center
                ),

                const SizedBox(height: 30),

                QuestionSummary(getSummaryData()),

                const SizedBox(height: 30),

                TextButton(
                  onPressed: onRestartQuiz,
                  child: const Text('Restart Quiz'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}