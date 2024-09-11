import 'package:flutter/cupertino.dart';

class GameManager extends ChangeNotifier {
  int _easyModeTotalCoins = 0;
  int get easyModeTotalCoins => _easyModeTotalCoins;

  int _hardModeTotalCoins = 0;
  int get hardModeTotalCoins => _hardModeTotalCoins;

  void setHardModeTotalCoins(int coins) {
    _hardModeTotalCoins += coins;
    notifyListeners();
  }

  void setEasyModeTotalCoins(int coins) {
    _easyModeTotalCoins += coins;
    notifyListeners();
  }
}
