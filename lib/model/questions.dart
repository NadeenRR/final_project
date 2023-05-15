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
