import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  final placeholder = 3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $placeholder out of 6 questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 156, 123, 240),
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text('List of the results'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: OutlinedButton.icon(
                onPressed:
                    () {}, //when button is pressed this restarts the quiz
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
