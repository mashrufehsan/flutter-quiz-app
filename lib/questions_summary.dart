import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map((data) {
            bool isAnswerCorrect = data['user_answer'] == data['correct_answer'];
            Color circleColor = isAnswerCorrect ? const Color.fromARGB(255, 104, 255, 155) : const Color.fromARGB(255, 255, 125, 125);
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: circleColor,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((data['question'] as String), style: const TextStyle(color: Colors.white, fontSize: 16),),
                      const SizedBox(
                        height: 5,
                      ),
                      Text((data['user_answer'] as String), style: const TextStyle(color: Color.fromARGB(255, 251, 255, 0), fontSize: 14),),
                      Text((data['correct_answer'] as String), style: const TextStyle(color: Color.fromARGB(255, 21, 255, 0), fontSize: 14),),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
