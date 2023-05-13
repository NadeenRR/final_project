class Question {
  int? id;
  String? question;
  String? answerA;
  String? answerB;
  String? answerC;
  String? answerD;
  String? correctAnswer;

  Question(
      {this.id,
      this.question,
      this.answerA,
      this.answerB,
      this.answerC,
      this.answerD,
      this.correctAnswer});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answerA': answerA,
      'answerB': answerB,
      'answerC': answerC,
      'answerD': answerD,
      'correctAnswer': correctAnswer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      question: map['question'],
      answerA: map['answerA'],
      answerB: map['answerB'],
      answerC: map['answerC'],
      answerD: map['answerD'],
      correctAnswer: map['correctAnswer'],
    );
  }
}


// class Questions {
//   int? id;
//   String? question;
//   String? answerA;
//   String? answerB;
//   String? answerC;
//   String? answerD;
//   String? correctAnswer;

//   // Questions({
//   //   // required this.id,
//   //   required this.question,
//   //   required this.answerA,
//   //   required this.answerB,
//   //   required this.answerC,
//   //   required this.answerD,
//   //   required this.correctAnswer,
//   // });

//   Questions(dynamic obj) {
//     id = obj['id'];
//     question = obj['question'];
//     answerA = obj['answerA'];
//     answerB = obj['answerB'];
//     answerC = obj['answerC'];
//     answerD = obj['answerD'];
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'question': question,
//       'answerA': answerA,
//       'answerB': answerB,
//       'answerC': answerC,
//       'answerD': answerD,
//       'correctAnswer': correctAnswer,
//     };
//   }

//   factory Questions.fromMap(Map<String, dynamic> map) {
//     return Questions(
//       id: map['id'] as int,
//       question: map['question'] as String,
//       answerA: map['answerA'] as String,
//       answerB: map['answerB'] as String,
//       answerC: map['answerC'] as String,
//       answerD: map['answerD'] as String,
//       correctAnswer: map['correctAnswer'] as String,
//     );
//   }
// }
