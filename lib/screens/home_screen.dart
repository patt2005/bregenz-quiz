import 'package:bregenz_quiz_game/screens/daily_quiz_screen.dart';
import 'package:bregenz_quiz_game/screens/mode_screen.dart';
import 'package:bregenz_quiz_game/screens/progress_screen.dart';
import 'package:bregenz_quiz_game/screens/settings_screen.dart';
import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:bregenz_quiz_game/widgets/fade_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.07),
            const Text(
              "BREGENZ QUIZ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: Colors.white,
                fontFamily: "InknutAntiqua",
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(15),
              child: Image.asset(
                "assets/images/image.png",
                width: screenSize.width,
                height: screenSize.height * 0.25,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenSize.height * 0.04),
            FadeButton(
              text: "New game",
              onPressed: () async {
                await Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const ModeScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: screenSize.height * 0.02),
            FadeButton(
              text: "Results",
              onPressed: () async {
                await Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const ProgressScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: screenSize.height * 0.02),
            FadeButton(
              text: "Daily quests",
              onPressed: () async {
                await Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const DailyQuizScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: screenSize.height * 0.02),
            FadeButton(
              text: "Settings",
              onPressed: () async {
                await Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
