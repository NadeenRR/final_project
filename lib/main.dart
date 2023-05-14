import 'package:final_project/screens/add_question.dart';
import 'package:final_project/screens/create_quiz.dart';
import 'package:final_project/screens/home_screen.dart';
import 'package:final_project/screens/result_screen_case1.dart';
import 'package:final_project/screens/result_screen_case2.dart';
import 'package:final_project/screens/result_screen_case3.dart';
import 'package:final_project/screens/sory_screen.dart';
import 'package:final_project/screens/statr_quiz_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      routes: {
        '/': (context) => const HomeScreen(),
        'create-quiz': (context) => const CreateQuizScreen(),
        'add-question': (context) => const AddQuestionScreen(),
        'result-case1': (context) => const ResultScreenCase1(),
        'result-case2': (context) => const ResultScreenCase2(),
        'result-case3': (context) => const ResultScreenCase3(),
        'sory': (context) => const SoryScreen(),
        'start-quiz': (context) => const StartQuizScreen(),
      },
    );
  }
}
