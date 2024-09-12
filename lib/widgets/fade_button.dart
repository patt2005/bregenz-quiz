import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:flutter/material.dart';

class FadeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const FadeButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(7),
        gradient: LinearGradient(
          colors: [redColor, whiteColor, redColor],
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: screenSize.height * 0.015),
          ),
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
