import 'package:flutter/cupertino.dart';

class GameManager extends ChangeNotifier {
  int _easyModeTotalCoins = 0;
  int get easyModeTotalCoins => _easyModeTotalCoins;

  int _hardModeTotalCoins = 0;
  int get hardModeTotalCoins => _hardModeTotalCoins;

  String _nickname = "";
  String get nickname => _nickname;

  String get profileImagePath => _profileImagePath;
  String _profileImagePath = "";

  void setNickname(String userName) {
    _nickname = userName;
    notifyListeners();
  }

  void setProfileImagePath(String path) {
    _profileImagePath = path;
    notifyListeners();
  }

  void setHardModeTotalCoins(int coins) {
    _hardModeTotalCoins += coins;
    notifyListeners();
  }

  void setEasyModeTotalCoins(int coins) {
    _easyModeTotalCoins += coins;
    notifyListeners();
  }
}
