import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int index = 0;
  PageController pageController = PageController();
  Color color = const Color(0xff123456);

  void getTap(int index) {
    this.index = index;
    getController(index);
    getColor();
    notifyListeners();
  }

  getController(int i) {
    pageController.animateToPage(i,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.ease);
  }

  getColor() {
    color = const Color(0xff123456);
  }
}
