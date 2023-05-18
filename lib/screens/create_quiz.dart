import 'package:flutter/material.dart';

import '../constance.dart';
import '../helper/database_helper.dart';
import '../model/questions.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({super.key});

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  var questions = [];
  late DatabaseHelper helper;
  List myDataList = [];

  @override
  void initState() {
    super.initState();
    helper = DatabaseHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Create Quiz'),
      body: Column(children: [
        InkWell(
          onTap: () => Navigator.pushNamed(context, 'add-question'),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: KPrimaryColor, borderRadius: BorderRadius.circular(8)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Add new question',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                ]),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: helper.getAllQuestions().then((value) {
              setState(() {});
              return value;
            }),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    // shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Question question =
                          Question.fromMap(snapshot.data[index]);
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 290,
                                              child: Text(
                                                question.question,
                                                // softWrap: true,
                                                style: const TextStyle(
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.grey.shade600,
                                              ),
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                        'Delete Question',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 25),
                                                      ),
                                                      content: const Text(
                                                        'Are you sure you want to delete this question?',
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              helper
                                                                  .deleteQuestion(
                                                                      question
                                                                          .id!);
                                                            });

                                                            Navigator.pop(
                                                                context);
                                                            const snackBar =
                                                                SnackBar(
                                                              content: Text(
                                                                  'Question deleted'),
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          2),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    snackBar);
                                                          },
                                                          child: const Text(
                                                              'Delete',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16)),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        question.answerA ==
                                                question.correctAnswer
                                            ? containerTrue(question.answerA)
                                            : containerFalse(question.answerA),
                                        question.answerB ==
                                                question.correctAnswer
                                            ? containerTrue(question.answerB)
                                            : containerFalse(question.answerB),
                                        question.answerC ==
                                                question.correctAnswer
                                            ? containerTrue(question.answerC)
                                            : containerFalse(question.answerC),
                                        question.answerD ==
                                                question.correctAnswer
                                            ? containerTrue(question.answerD)
                                            : containerFalse(question.answerD),
                                      ]))));
                    });
              }
            },
          ),
        ),
      ]),
    );
  }
}
