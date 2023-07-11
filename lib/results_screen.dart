import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          //   QuestionMapKeys.question.name == 'question'
          QuestionMapKeys.question_index.name: i,
          QuestionMapKeys.question.name: questions[i].text,
          QuestionMapKeys.correct_answer.name: questions[i].answers[0],
          QuestionMapKeys.user_answer.name: chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where(
          (data) =>
              data[QuestionMapKeys.user_answer.name] ==
              data[QuestionMapKeys.correct_answer.name],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score $numCorrectQuestions out of $numTotalQuestions ',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quize!'),
            ),
          ],
        ),
      ),
    );
  }
}

enum QuestionMapKeys {
  question, // name: question , index = 0
  question_index,
  correct_answer,
  user_answer,
  start_screen,
  questions_screen,
  results_screen,
}
