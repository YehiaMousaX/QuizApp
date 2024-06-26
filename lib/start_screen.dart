import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: const Color.fromARGB(139, 255, 255, 255),
            width: 200.0,
          ),
          const Padding(padding: EdgeInsets.all(20)),
          const Text(
            'Learn flutter the fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 20.0,
              ),
            ),
            icon: const Icon(Icons.play_arrow),
            label: const Text("Start Quiz"),
          )
        ],
      ),
    );
  }
}
