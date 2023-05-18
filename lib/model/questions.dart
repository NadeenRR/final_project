class Question {
  int? id;
  final String question;
  final String answerA;
  final String answerB;
  final String answerC;
  final String answerD;
  final String correctAnswer;

  Question(
      {this.id,
      required this.question,
      required this.answerA,
      required this.answerB,
      required this.answerC,
      required this.answerD,
      required this.correctAnswer});

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
