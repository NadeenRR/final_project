import 'package:flutter/material.dart';

import '../constance.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Quiz App'),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RichText(
              text: const TextSpan(children: [
            TextSpan(
                text: 'Question 1',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: '  /10',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w400))
          ])),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(8)),
            child: const Text(
              'Flutter .....?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          answerContainer(''),
          answerContainer(''),
          answerContainer(''),
          answerContainer('')
        ]),
      ),
    );
  }
}
