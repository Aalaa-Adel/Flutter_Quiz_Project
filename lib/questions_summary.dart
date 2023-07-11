import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/results_screen.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(
    this.summaryData, {
    super.key,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: const Color.fromARGB(255, 36, 93, 63),
                      child: Text(
                        ((data[QuestionMapKeys.question_index.name] as int) + 1)
                            .toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[QuestionMapKeys.question.name] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(186, 0, 0, 0),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data[QuestionMapKeys.user_answer.name] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 9, 244, 170),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            data[QuestionMapKeys.correct_answer.name] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 10, 216, 223),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
