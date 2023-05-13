import 'package:flutter/material.dart';

import '../helper/database_helper.dart';
import '../model/questions.dart';


class QuestionListPage extends StatefulWidget {
  @override
  _QuestionListPageState createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  List<Question> questions = [];

  @override
  void initState() {
    super.initState();
    _getQuestions();
  }

  _getQuestions() async {
    final List<Map<String, dynamic>> maps =
        await DatabaseHelper.instance.getAllQuestions();
    setState(() {
      questions = List.generate(maps.length, (i) {
        return Question.fromMap(maps[i]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions List'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return ListTile(
            title: Text(question.question!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAnswerWidget(question.answerA!,
                    question.correctAnswer == question.answerA),
                _buildAnswerWidget(question.answerB!,
                    question.correctAnswer == question.answerB),
                _buildAnswerWidget(question.answerC!,
                    question.correctAnswer == question.answerC),
                _buildAnswerWidget(question.answerA!,
                    question.correctAnswer == question.answerD),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnswerWidget(String answer, bool isCorrect) {
    return Text(
      answer,
      style: TextStyle(
        color: isCorrect ? Colors.green : Colors.black,
        fontWeight: isCorrect ? FontWeight.bold : FontWeight.normal,
        fontSize: isCorrect ? 30 : 20,
      ),
    );
  }
}
