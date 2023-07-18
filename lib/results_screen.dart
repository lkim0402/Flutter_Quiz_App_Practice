import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/results_summary.dart';
import 'package:quizz_app/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.startQuiz});

  final void Function() startQuiz;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    //we return a list of maps which 'maps' values to keys
    //key -> String, values -> Object (different types of values - strings and numbers)
    final List<Map<String, Object>> summary = [];

    //We populate the list
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
      //where method allows to *filter* the list you're calling it and returns a new list
      //If they are equal, then user chose the correct answer
    }).length;
    //Since we want the length, the amount of objects that were kept

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 211, 154, 255),
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            ResultsSummary(summaryData),
            //the outline of all the answers and stuff
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: OutlinedButton.icon(
                onPressed:
                    startQuiz, //when button is pressed this restarts the quiz
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 75, 26, 143),
                ),
                icon: const Icon(Icons.restart_alt_outlined),
                label: const Text(
                  'Restart quiz',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
