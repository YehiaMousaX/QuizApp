import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chooseAnswer, required this.reset});
  final List<String> chooseAnswer;
  final void Function() reset;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'your_answer': chooseAnswer[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummary();
    final numOfQuestions = questions.length;
    final numOfCorrectAnswers = summaryData.where((data) {
      return data['your_answer'] == data['correct_answer'];
    }).length;

    return Center(
        child: Container(
            margin: const EdgeInsets.all(40.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      "Your Answered $numOfCorrectAnswers out of $numOfQuestions Correct !",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      )),
                  const Padding(padding: EdgeInsets.all(20)),
                  QuestionSummary(summaryData),
                  const Padding(padding: EdgeInsets.all(20)),
                  OutlinedButton.icon(
                    onPressed: () {
                      chooseAnswer.clear();
                      reset();
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 38, 1, 82),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 10.0,
                      ),
                    ),
                    label:
                        const Text("Restart Quiz", textAlign: TextAlign.center),
                    icon: const Icon(Icons.replay),
                  )
                ])));
  }
}
