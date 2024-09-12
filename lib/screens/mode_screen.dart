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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FadeButton(
                      text: "Easy",
                      onPressed: () async {
                        await Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const CategoryScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: FadeButton(
                      text: "Hard",
                      onPressed: () async {
                        await Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const HardQuizScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              FadeButton(
                text: "Return",
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
