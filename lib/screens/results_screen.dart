import 'package:bregenz_quiz_game/screens/story_screen.dart';
import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:bregenz_quiz_game/widgets/fade_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  final int answeredQuestions;
  final int totalCoins;

  const ResultsScreen({
    super.key,
    required this.answeredQuestions,
    required this.totalCoins,
  });

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.01),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [redColor, whiteColor, redColor],
                  ),
                ),
                width: screenSize.width,
                child: Image.asset(
                  "assets/images/profile_image.png",
                  width: screenSize.width,
                  height: screenSize.height * 0.22,
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
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
                      widget.totalCoins.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Image.asset(
                      "assets/images/coins.png",
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Text(
                "${widget.answeredQuestions}/10",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Container(
                padding: EdgeInsets.all(screenSize.height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [redColor, whiteColor, redColor],
                  ),
                ),
                width: screenSize.width,
                child: const Text(
                  "An interesting story about the city is available to you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              FadeButton(
                text: "Read",
                onPressed: () async {
                  await Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const StoryScreen(),
                    ),
                  );
                },
              ),
              const Spacer(),
              FadeButton(
                text: "Back",
                onPressed: () {
                  for (int i = 0; i < 2; i++) {
                    Navigator.of(context).pop();
                  }
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
