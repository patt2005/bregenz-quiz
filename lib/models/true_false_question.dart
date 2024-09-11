class TrueFalseQuestion {
  final String question;
  final bool answer;

  TrueFalseQuestion({
    required this.question,
    required this.answer,
  });

  static TrueFalseQuestion fromJson(Map<String, dynamic> jsonData) {
    return TrueFalseQuestion(
      question: jsonData["question"],
      answer: jsonData["answer"],
    );
  }
}
