import 'package:bregenz_quiz_game/screens/info_screen.dart';
import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height * 0.1,
                width: double.infinity,
              ),
              Image.asset(
                "assets/images/Star 5.png",
                width: 33,
                height: 33,
              ),
              const SizedBox(height: 10),
              Text(
                "B",
                style: TextStyle(
                  fontFamily: "InknutAntiqua",
                  fontWeight: FontWeight.w400,
                  fontSize: 40,
                  color: whiteColor,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: screenSize.width,
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.05,
                  vertical: screenSize.height * 0.02,
                ),
                decoration: BoxDecoration(
                  color: buttonColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BREGENZ QUIZ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: whiteColor,
                        fontFamily: "InknutAntiqua",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * 0.2),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(buttonColor),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.05,
                      vertical: screenSize.height * 0.02,
                    ),
                  ),
                ),
                onPressed: () async {
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const InfoScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "JOIN NOW",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: "InknutAntiqua",
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
