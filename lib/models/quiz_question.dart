//A file that contains the question blueprints

class QuizQuestion {
  //doesn't extend anything because it's not a widget
  const QuizQuestion(this.text, this.answers);

  //these are the 2 properties that exist in QuizQuestion
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    //returns a list of string values

    final shuffledList = List.of(answers);
    //'of' constructor function copies and creates a new list -> shuffle function touches the original list

    shuffledList.shuffle();
    //we shuffle the copied list

    return shuffledList;
  }
}
