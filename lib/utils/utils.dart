import 'dart:ui';

late Size screenSize;

final List<String> categories = [
  "Bregenzer Festspiele",
  "Lake Constance",
  "Pfänder Mountain",
  "Historic Old Town",
  "Vorarlberg Museum",
  "Kunsthaus Bregenz"
];

const Color firstGoldColor = Color(0xFFF2D69A);
const Color secondGoldColor = Color(0xFFB8812A);

Color backgroundColor = const Color(0xFF36010B);
Color buttonColor = const Color(0xFFEF1111);
Color redColor = const Color(0xFFF13333);
Color whiteColor = const Color(0xFFFFFFFF);

String formatTime(int seconds) {
  final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
  final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
  return '$minutes:$remainingSeconds';
}
