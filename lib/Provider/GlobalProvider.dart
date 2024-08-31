import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  bool firstTimeView = true;

  void toggleFirstTimeView() {
    firstTimeView = !firstTimeView;
    notifyListeners();
  }
}
