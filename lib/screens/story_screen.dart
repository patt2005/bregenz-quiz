import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:bregenz_quiz_game/widgets/fade_button.dart';
import 'package:flutter/material.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

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
              const Text(
                "The Ancient Origins of Bregenz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(screenSize.height * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [redColor, whiteColor, redColor],
                    ),
                  ),
                  width: screenSize.width,
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          """Bregenz’s history dates back over 2,000 years to when it was first settled by the Celts around 500 BC. These early inhabitants, known as the Brigantii tribe, gave the town its name, which evolved over centuries. The town’s strategic location along the shores of Lake Constance made it an ideal place for trade and growth. In 15 BC, the Romans, recognizing the city's importance, conquered it and established "Brigantium," turning it into a significant military post.
                  
                  Over time, the town's role as a crossroads between Roman Italy and the Germanic tribes in the north allowed it to flourish as a trading hub. Even after the fall of the Roman Empire, Bregenz remained a vibrant town, adapting to the tides of history and maintaining its importance in the region.
                  
                  Martinsturm and the Tower's Tale
                  One of the most iconic landmarks in Bregenz is the Martinsturm (Martin's Tower), which stands as a symbol of the city's medieval history. Originally built in 1601, the tower was part of a fortress designed to defend the city. Its distinct onion-shaped dome is the largest of its kind in Europe, and it offers breathtaking views of the city, lake, and mountains.
                  
                  The Martinsturm holds a legend tied to the city's survival. According to local folklore, during a siege in the 15th century, Bregenz was on the verge of falling to enemy forces. In a desperate move, the women of Bregenz donned armor and marched to the city's walls, pretending to be reinforcements. The ruse worked, scaring off the attackers and saving the city. Since then, the women of Bregenz have been celebrated for their bravery, and the Martinsturm stands as a testament to the resilience of the town.
                  
                  The Magic of the Bregenzer Festspiele
                  Fast forward to the modern era, and Bregenz has gained global fame for its Bregenzer Festspiele (Bregenz Festival), an annual performing arts event that takes place each summer. What makes this festival truly unique is its floating stage on Lake Constance, where larger-than-life operas and performances are staged against the stunning backdrop of the Alps.
                  
                  Each year, the stage is rebuilt to reflect a different theme, often featuring giant, intricate set designs that seem to rise out of the water. This floating stage has hosted internationally acclaimed productions such as Carmen and Aida. In 2008, the set for Tosca was featured in the James Bond film Quantum of Solace, bringing worldwide attention to this picturesque lakeside town.
                  
                  The festival's origins are rooted in the town's love for the arts, dating back to 1946, just after World War II. At the time, the residents of Bregenz wanted to revive the town's cultural scene and create something that would bring people together after the hardships of the war. Today, the Bregenzer Festspiele is one of Europe's most famous and spectacular festivals, attracting thousands of visitors from around the world each year.
                  
                  """,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              FadeButton(
                text: "Back",
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
