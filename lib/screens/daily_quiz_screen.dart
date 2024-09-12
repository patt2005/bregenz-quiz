import 'dart:convert';
import 'package:bregenz_quiz_game/models/true_false_question.dart';
import 'package:bregenz_quiz_game/screens/results_screen.dart';
import 'package:bregenz_quiz_game/screens/story_screen.dart';
import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:bregenz_quiz_game/widgets/fade_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DailyQuizScreen extends StatefulWidget {
  const DailyQuizScreen({super.key});

  @override
  State<DailyQuizScreen> createState() => _DailyQuizScreenState();
}

class _DailyQuizScreenState extends State<DailyQuizScreen> {
  final List<TrueFalseQuestion> _questions = [];

  int _currentQuestionIndex = 1;
  int? _selectedOptionIndex;
  bool _isAnswerCorrect = false;

  int _answeredQuestions = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
  }

  void _init() async {
    final String jsonData =
        await rootBundle.loadString("assets/data/daily_questions.json");
    final Map<String, dynamic> data = jsonDecode(jsonData);
    final questionDataList = data["questions"];
    for (var questionData in questionDataList) {
      _questions.add(TrueFalseQuestion.fromJson(questionData));
    }
    setState(() {});
  }

  Widget _buildOptionCard(String text, VoidCallback onPressed, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: screenSize.height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [redColor, whiteColor, redColor],
        ),
      ),
      width: screenSize.width,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsetsDirectional.symmetric(vertical: screenSize.height * 0.02),
          ),
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(
            _selectedOptionIndex == index
                ? _isAnswerCorrect
                    ? Colors.green.withOpacity(0.5)
                    : Colors.pink.withOpacity(0.8)
                : Colors.transparent,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _questions.isEmpty
          ? const Center(
              child: CupertinoActivityIndicator(
                color: Colors.white,
              ),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: screenSize.height * 0.01),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/daily_quiz_image.png",
                        width: screenSize.width,
                        height: screenSize.height * 0.22,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Text(
                      _questions[_currentQuestionIndex].question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.05),
                    _buildOptionCard("True", () async {
                      if (_selectedOptionIndex == null) {
                        setState(() {
                          _selectedOptionIndex = 0;
                          _isAnswerCorrect =
                              _questions[_currentQuestionIndex].answer == true;
                          if (_isAnswerCorrect) {
                            _answeredQuestions++;
                          }
                        });
                      }
                    }, 0),
                    _buildOptionCard("False", () async {
                      if (_selectedOptionIndex == null) {
                        setState(() {
                          _selectedOptionIndex = 1;
                          _isAnswerCorrect =
                              _questions[_currentQuestionIndex].answer == false;
                          if (_isAnswerCorrect) {
                            _answeredQuestions++;
                          }
                        });
                      }
                    }, 1),
                    const Spacer(),
                    if (_selectedOptionIndex != null)
                      FadeButton(
                        text: "Continue",
                        onPressed: () async {
                          _currentQuestionIndex++;
                          if (_currentQuestionIndex >= _questions.length) {
                            await Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const StoryScreen(),
                              ),
                            );
                          }
                          _selectedOptionIndex = null;
                          _isAnswerCorrect = false;
                          setState(() {});
                        },
                      ),
                    const SizedBox(height: 10),
                    FadeButton(
                      text: "Return",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                  ],
                ),
              ),
            ),
    );
  }
}
