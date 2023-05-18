// import 'package:flutter/material.dart';

// import '../constance.dart';
// import '../model/questions.dart';

// class AnswerContiner extends StatefulWidget {
//   const AnswerContiner({super.key, required this.onTap, required this.answer, required this.isSelected});
//   final Function() onTap;
//   final String answer;
//   final bool isSelected;

//   @override
//   State<AnswerContiner> createState() => _AnswerContinerState();
// }

// class _AnswerContinerState extends State<AnswerContiner> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: widget.onTap,
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//         decoration: BoxDecoration(
//             border: Border.all(color: KPrimaryColor),
//             borderRadius: BorderRadius.circular(8)),
//         child: Text(
//           widget.answer,
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//           ),
//         ),
//       ),
//     );
//   }


//   int onTap() {
//     Question? question = Question();
//     int score = 0;
//     setState(() {
//       // questionIndex++;
//       if (question.answerA == question.correctAnswer) {
//         score++;
//       } else if (question.correctAnswer == question.answerB) {
//         score++;
//       } else if (question.correctAnswer == question.answerA) {
//         score++;
//       } else if (question.correctAnswer == question.answerD) {
//         score++;
//       }
//       print(score);
//     });
//     return score;
//   }
// }
