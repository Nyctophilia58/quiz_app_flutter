import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/answer_button.dart';
import '../components/common.dart';
import 'package:quiz_app_flutter/components/questions.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: Container(
          decoration: bodyDecor,
          child: SizedBox(
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch ,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentQuestion.text,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 171, 170, 230),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  ...currentQuestion.getShuffledAnswers().map((answer) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0), // Set fixed spacing here
                      child: AnswerButton(
                        answerText: answer,
                        onTap: (){
                          answerQuestion(answer);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          )
      ),
    );
  }
}