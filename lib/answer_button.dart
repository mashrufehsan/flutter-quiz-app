import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answer, this.onTap, {super.key});

  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40,),
          backgroundColor: const Color.fromARGB(255, 41, 20, 78),
          foregroundColor: Colors.white,
        ),
        child: Text(answer, textAlign: TextAlign.center,),
      ),
    );
  }
}
