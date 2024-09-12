import 'package:bregenz_quiz_game/models/game_manager.dart';
import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:bregenz_quiz_game/widgets/fade_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameManager>(context, listen: false);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.01),
              Consumer<GameManager>(
                builder: (context, value, child) => Container(
                  padding:
                      EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [redColor, whiteColor, redColor],
                    ),
                  ),
                  width: screenSize.width,
                  child: Image.asset(
                    value.profileImagePath.isEmpty
                        ? "assets/images/profile_image.png"
                        : value.profileImagePath,
                    width: screenSize.width,
                    height: screenSize.height * 0.18,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),

              // Updated layout for "Easy" and "Hard" with coins
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: screenSize.height * 0.1,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: [redColor, whiteColor, redColor],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Easy",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                provider.easyModeTotalCoins.toString(),
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
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Container(
                      height: screenSize.height * 0.1,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: [redColor, whiteColor, redColor],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Hard",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                provider.hardModeTotalCoins.toString(),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              FadeButton(
                text: "Share",
                onPressed: () async {
                  await Share.share(
                      'Easy mode coins: ${provider.easyModeTotalCoins}, Hard mode coins: ${provider.hardModeTotalCoins}');
                },
              ),
              SizedBox(height: screenSize.height * 0.02),
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
