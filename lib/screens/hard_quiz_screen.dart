import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bregenz_quiz_game/models/game_manager.dart';
import 'package:bregenz_quiz_game/models/question.dart';
import 'package:bregenz_quiz_game/screens/results_screen.dart';
import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:bregenz_quiz_game/widgets/fade_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HardQuizScreen extends StatefulWidget {
  const HardQuizScreen({super.key});

  @override
  State<HardQuizScreen> createState() => _HardQuizScreenState();
}

class _HardQuizScreenState extends State<HardQuizScreen> {
  final List<Question> _questions = [];
  int _categoryIndex = 0;

  int _currentQuestionIndex = 1;
  int? _selectedOptionIndex;
  bool _isAnswerCorrect = false;

  late Timer _timer;
  int _remainingSeconds = 180;

  int _answeredQuestions = 0;

  int _totalCoins = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _init(),
    );
  }

  void _saveCoins(BuildContext context) {
    final provider = Provider.of<GameManager>(context, listen: false);
    provider.setHardModeTotalCoins(_totalCoins);
  }

  void _init() async {
    _totalCoins = 0;
    _categoryIndex = Random().nextInt(categories.length);
    final String jsonData =
        await rootBundle.loadString("assets/data/questions.json");
    final Map<String, dynamic> data = jsonDecode(jsonData);
    final questionDataList = data["categories"][categories[_categoryIndex]];
    for (var questionData in questionDataList) {
      _questions.add(Question.fromJson(questionData));
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) async {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _saveCoins(context);
          _timer.cancel();
          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ResultsScreen(
                answeredQuestions: _answeredQuestions,
                totalCoins: _totalCoins,
              ),
            ),
          );
        }
        setState(() {});
      },
    );
  }

  Widget _buildOptionCard(String text, VoidCallback onPressed, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: screenSize.height * 0.01),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [redColor, whiteColor, redColor],
        ),
      ),
      width: screenSize.width,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(
            _selectedOptionIndex == index
                ? _isAnswerCorrect
                    ? Colors.green.withOpacity(0.5)
                    : Colors.red.withOpacity(0.5)
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
  void dispose() {
    _timer.cancel();
    super.dispose();
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
                      borderRadius: BorderRadiusDirectional.circular(15),
                      child: Image.asset(
                        "assets/images/categories/preview/image${_categoryIndex + 1}.png",
                        width: screenSize.width,
                        height: screenSize.height * 0.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Text(
                      _questions[_currentQuestionIndex].question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    SizedBox(
                      height: screenSize.height * 0.06,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: LinearGradient(
                                  colors: [redColor, whiteColor, redColor],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  formatTime(_remainingSeconds),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: LinearGradient(
                                  colors: [redColor, whiteColor, redColor],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _totalCoins.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 23,
                                    ),
                                  ),
                                  const SizedBox(width: 7),
                                  Image.asset(
                                    "assets/images/coins.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    for (int i = 0;
                        i < _questions[_currentQuestionIndex].options.length;
                        i++)
                      _buildOptionCard(
                        _questions[_currentQuestionIndex].options[i],
                        () async {
                          if (_selectedOptionIndex == null) {
                            setState(() {
                              _selectedOptionIndex = i;
                              _isAnswerCorrect = i ==
                                  _questions[_currentQuestionIndex - 1]
                                      .answerIndex;
                              if (_isAnswerCorrect) {
                                _totalCoins += 100;
                                _answeredQuestions++;
                              }
                            });
                          }
                        },
                        i,
                      ),
                    GestureDetector(
                      onTap: () {
                        if (_totalCoins >= 200) {
                          List<dynamic> optionsList =
                              _questions[_currentQuestionIndex].options;
                          int correctIndex =
                              _questions[_currentQuestionIndex].answerIndex;

                          List<dynamic> incorrectOptions =
                              optionsList.where((option) {
                            return optionsList.indexOf(option) != correctIndex;
                          }).toList();

                          if (incorrectOptions.isNotEmpty) {
                            optionsList.remove(incorrectOptions.first);
                          }
                          _totalCoins -= 200;
                          setState(() {});
                        }
                      },
                      child: Image.asset(
                        "assets/images/bolt.png",
                        width: screenSize.height * 0.1,
                        height: screenSize.height * 0.1,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            secondGoldColor,
                            firstGoldColor,
                            secondGoldColor
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 30),
                          const Text(
                            "200",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Image.asset(
                            "assets/images/coins.png",
                            width: 35,
                            height: 35,
                          ),
                          const SizedBox(width: 30),
                        ],
                      ),
                    ),
                    const Spacer(),
                    if (_selectedOptionIndex != null)
                      FadeButton(
                        text: "Continue",
                        onPressed: () async {
                          _currentQuestionIndex++;
                          if (_currentQuestionIndex >= _questions.length) {
                            _saveCoins(context);
                            await Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => ResultsScreen(
                                  answeredQuestions: _answeredQuestions,
                                  totalCoins: _totalCoins,
                                ),
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
