import 'package:final_project/model/questions.dart';
import 'package:final_project/screens/sory_screen.dart';
import 'package:flutter/material.dart';

import '../constance.dart';
import '../helper/database_helper.dart';

class StartQuizScreen extends StatefulWidget {
  const StartQuizScreen({super.key});

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  late DatabaseHelper helper;
  Question? question = Question();
  int questionIndex = 0;
  int score = 1;
  int totalScore = 0;

  void answeQuestion() {
    //
    setState(() {
      if (question!.answerA == question!.correctAnswer) {
        score = 1;
        totalScore = score + totalScore;
        print(totalScore);
      } else if (question!.answerB == question!.correctAnswer) {
        score = 1;
        totalScore = score + totalScore;
        print(totalScore);
      } else if (question!.answerC == question!.correctAnswer) {
        score = 1;
        totalScore = score + totalScore;
        print(totalScore);
      } else if (question!.answerD == question!.correctAnswer) {
        score = 1;
        totalScore = score + totalScore;
        print(totalScore);
      }
      questionIndex++;
      //  questionIndex = question!.id!;
    });
    print(questionIndex);
  }

  @override
  void initState() {
    super.initState();
    helper = DatabaseHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Quiz App'),
      body: FutureBuilder(
          future: helper.getAllQuestions().then((value) {
            setState(() {});
            return value;
          }),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            Question question2 = Question.fromMap(snapshot.data[questionIndex]);
            int questionStart = questionIndex + 1;
            if (snapshot.hasData) {
              final questions = snapshot.data!;
              if (questions.length < 5) {
                return const SoryScreen();
              } else {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          const TextSpan(
                              text: 'Question ',
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: questionStart.toString(),
                              style: const TextStyle(
                                  color: Colors.teal,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          const TextSpan(
                              text: '  /',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: questions.length.toString(),
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400))
                        ])),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            question2.question!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        answerContainer(question2.answerA!, answeQuestion),
                        answerContainer(question2.answerB!, answeQuestion),
                        answerContainer(question2.answerC!, answeQuestion),
                        answerContainer(question2.answerD!, answeQuestion)
                      ]),
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
