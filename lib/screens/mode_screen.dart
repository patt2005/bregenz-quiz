import 'package:bregenz_quiz_game/screens/category_screen.dart';
import 'package:bregenz_quiz_game/screens/hard_quiz_screen.dart';
import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:bregenz_quiz_game/widgets/fade_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModeScreen extends StatelessWidget {
  const ModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.2),
              FadeButton(
                text: "Easy",
                onPressed: () async {
                  await Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const CategoryScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenSize.height * 0.04),
              FadeButton(
                text: "Hard",
                onPressed: () async {
                  await Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const HardQuizScreen(),
                    ),
                  );
                },
              ),
              const Spacer(),
              FadeButton(
                text: "Back",
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(height: screenSize.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
