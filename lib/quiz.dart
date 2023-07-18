//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/results_screen.dart';
import 'package:quizz_app/start_screen.dart';
import 'package:quizz_app/data/questions.dart';

//This dart file manages all the quiz pages in the app

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start_screen';
  List<String> selectedAnswers = []; //list of answers chosen by user

  void switchScreen() {
    setState(() {
      //we put in any data-changing activities here in the UI
      //It re-executes the build method and update

      activeScreen = 'questions_screen';
      //you can store widgets in variables
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      //we switch to result screen
      setState(() {
        selectedAnswers = []; //after everything is over, we empty the array
        activeScreen = 'results_screen';
      });
    }
  }

  @override
  Widget build(context) {
    //Build method is executed when the widget is rendered for the first time and after set state is called

    Widget screenWidget = StartScreen(switchScreen);
    //Initially start the screen through StartScreen with switchScreen passed in

    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionScreen(chooseAnswer);
      //chooseAnswer will get executed whenever an answer gets picked in QuestionScreen
    }
    if (activeScreen == 'results_screen') {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers);
    }
    //We pass in selected Answers

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 75, 26, 143),
                Color.fromARGB(255, 155, 104, 225),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
