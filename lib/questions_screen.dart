import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionIndex = 0;

  void questionAnswered(String selectedAnswer) {
    //executes when question is answered, or answer button is pressed

    widget.onSelectAnswer(selectedAnswer);
    //allows to use the onSelectAnswer, which is im QuestionScreen class

    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    final screenIndex = questionIndex + 1;

    return SizedBox(
      width: double.infinity, //takes as much width as available
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //main axis of column -> vertical
          crossAxisAlignment:
              CrossAxisAlignment.stretch, //cross axis of column -> horizontal
          children: [
            Text(
              'Question $screenIndex',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 214, 196, 255),
                  fontSize: 15),
            ),
            Text(
              currentQuestion.text, //getting the question
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 236, 217, 255),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ), //const
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnswerButton(
                  answer,
                  () {
                    questionAnswered(answer);
                  },
                ),
              );
              //transformed item
              /*
              - Through map() we convert the list of answer strings into AnswerButton widgets that *use* this list of strings
              - Lists in general have *lots* of functions that can be called (map() is just one of them, which mainly converts).
              - The function passed will automatically be run by Dart for evey item
              - This conversion does not change the original list, but creates a new list of AnswerButtons
              - We return an AnswerButton, a widget that we made
              - Then these AnswerButtons are pulled out using '...' and are 'spreaded' or added as *individual elements* in this children list
              - We spread these since children does not accept nested lists
              - Now they're dynamically generated, not hard coded
              - When button clicked, questionAnswered is executed
              */
            }),
          ],
        ),
      ),
    );
  }
}
