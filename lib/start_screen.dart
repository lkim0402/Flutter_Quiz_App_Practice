import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  //We pass in void FUnction() startQuiz in order to use switchScreen

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Image(
            image: AssetImage('assets/images/quiz-logo.png'),
            height: 400,
            color: Color.fromARGB(137, 255, 255, 255),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 60, bottom: 30),
            child: Text(
              'Learn Flutter the easy way!',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 35,
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed:
                startQuiz, //when button is pressed, this activates startQuiz, which is equal to switchscreen() which was passed as a parameter
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_circle_right_sharp),
            label: const Text(
              'Start quiz',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
