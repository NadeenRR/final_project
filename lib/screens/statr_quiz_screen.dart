import 'package:final_project/model/questions.dart';
import 'package:final_project/screens/result_screen_case1.dart';
import 'package:final_project/screens/result_screen_case2.dart';
import 'package:final_project/screens/result_screen_case3.dart';
import 'package:final_project/screens/sory_screen.dart';
import 'package:flutter/material.dart';

import '../constance.dart';
import '../helper/database_helper.dart';
import 'correct_question.dart';

class StartQuizScreen extends StatefulWidget {
  const StartQuizScreen({super.key});

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  DatabaseHelper helper = DatabaseHelper.instance;
  //Question question = Question(question: '');
  int questionIndex = 0;
  int score = 0;
  int totalScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Quiz App'),
      body: FutureBuilder(
          future: helper.getAllQuestions(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            Question question2 = Question.fromMap(snapshot.data[questionIndex]);
            final questions = snapshot.data;
            if (questions.length < 5 || questions.isEmpty) {
              return const SoryScreen();
            } else {
              if (questionIndex < questions.length) {
                return PageView.builder(
                    itemCount: questions.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: 'Question ${questionIndex + 1} ',
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' / ${questions.length.toString()}',
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
                                  question2.question,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              answerContainer(
                                  question2.answerA,
                                  question2.answerA == question2.correctAnswer
                                      ? incremt
                                      : () {
                                          setState(() {
                                            questionIndex++;
                                          });
                                        }),
                              answerContainer(
                                  question2.answerB,
                                  question2.answerB == question2.correctAnswer
                                      ? incremt
                                      : () {
                                          setState(() {
                                            questionIndex++;
                                          });
                                        }),
                              answerContainer(
                                  question2.answerC,
                                  question2.answerC == question2.correctAnswer
                                      ? incremt
                                      : () {
                                          setState(() {
                                            questionIndex++;
                                          });
                                        }),
                              answerContainer(
                                  question2.answerD,
                                  question2.answerD == question2.correctAnswer
                                      ? incremt
                                      : () {
                                          setState(() {
                                            questionIndex++;
                                          });
                                        }),
                            ]),
                      );
                    });
              } else {
                if (score < 5) {
                  return ResultScreenCase3(
                    score: score,
                    totalQuestions: questions.length,
                  );
                } else if (score == 5) {
                  return ResultScreenCase2(
                    score: score,
                    totalQuestions: questions.length,
                  );
                } else if (score > 5) {
                  return ResultScreenCase1(
                    score: score,
                    totalQuestions: questions.length,
                  );
                }
              }
              return const CircularProgressIndicator();
            }
          }),
    );
  }

  incremt() {
    setState(() {
      score++;
    });
    questionIndex++;
    print(score);
    //print(totalScore);
  }
}
