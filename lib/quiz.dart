import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';


class Quiz extends StatefulWidget{

  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }

}

class _QuizState extends State<Quiz>{

  List<String> selectedAnswers =[];

  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultsScreen(chosenAnswers: selectedAnswers);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 138, 20, 235),
              Color.fromARGB(255, 86, 1, 155)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}