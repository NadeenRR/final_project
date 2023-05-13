import 'package:final_project/screens/add_question.dart';
import 'package:final_project/screens/create_quiz.dart';
import 'package:final_project/screens/home_screen.dart';
import 'package:final_project/screens/test.dart';
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
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/': (context) => const HomeScreen(),
        'create-quiz': (context) => const CreateQuizScreen(),
        'add-question': (context) => const AddQuestionScreen()
      },
    );
  }
}
