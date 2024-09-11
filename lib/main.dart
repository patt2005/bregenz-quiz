import 'package:bregenz_quiz_game/models/game_manager.dart';
import 'package:bregenz_quiz_game/screens/intro_screen.dart';
import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) => GameManager(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bregenz Quiz',
      theme: ThemeData(fontFamily: "Inter"),
      home: const IntroScreen(),
    );
  }
}
