import 'package:bregenz_quiz_game/screens/home_screen.dart';
import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.02),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/globe.png",
                      width: 45,
                      height: 45,
                    ),
                    const Spacer(),
                    Text(
                      "Discover Bregenz",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        fontFamily: "InknutAntiqua",
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/globe.png",
                      width: 45,
                      height: 45,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    "assets/images/intro.png",
                    width: screenSize.width,
                    height: screenSize.height * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient(
                      colors: [redColor, whiteColor, redColor],
                    ),
                  ),
                  width: screenSize.width,
                  child: const Column(
                    children: [
                      Text(
                        "Bergen is a picturesque city in southwestern Norway known for its stunning fjord scenery and vibrant cultural life. Surrounded by seven mountains and situated along the coast, it’s famous for its colorful wooden buildings in Bryggen, a UNESCO World Heritage Site. With a reputation as Norway's rainiest city, Bergen offers a mild maritime climate and frequent rainfall. It's also a gateway to exploring the nearby fjords and a hub for festivals and cultural events.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
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
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "START NOW",
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
                SizedBox(height: screenSize.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
