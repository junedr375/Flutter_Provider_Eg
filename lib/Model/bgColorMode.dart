import 'package:flutter/material.dart';

class BgColorProvider extends ChangeNotifier {
  bool isDark = false;
  changeThem() {
    isDark = !isDark;
    notifyListeners();
  }
}
