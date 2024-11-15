import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/common.dart';

class HomePage extends StatelessWidget{
  const HomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bodyDecor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/quiz-logo.png',
                width: 300,
                height: 300,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),

              const SizedBox(height: 80),

              const Text(
                'Learn Flutter the fun way!',
                style: TextStyle(
                  color: Color.fromARGB(255, 191, 190, 230),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              OutlinedButton.icon(
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text(
                  'Start Quiz',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}