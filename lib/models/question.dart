class Question {
  final String question;
  final List<dynamic> options;
  final int answerIndex;

  Question({
    required this.question,
    required this.options,
    required this.answerIndex,
  });

  static Question fromJson(Map<String, dynamic> json) {
    return Question(
      question: json["question"],
      options: json["options"],
      answerIndex: json["correctAnswerIndex"],
    );
  }
}
