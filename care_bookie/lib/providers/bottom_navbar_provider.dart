import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class BottomNavBarProvider extends ChangeNotifier {
  bool _visible = true;
  final ScrollController _scrollController = ScrollController();

  bool get visible => _visible;
  ScrollController get scrollController => _scrollController;

  set visible(bool value) {
    _visible = value;
    notifyListeners();
  }

  void bottomNavBarListener() {
    _scrollController.addListener(() {
      final direction =
          _scrollController.position.userScrollDirection;

      if (direction == ScrollDirection.forward) {
        if (_visible) {
          show();
        }
      } else if (direction == ScrollDirection.reverse) {
        if (_visible) {
          hide();
        }
      }
    });
  }

  void show() {
    _visible = true;
    notifyListeners();
  }

  void hide() {
    _visible = false;
    notifyListeners();
  }

}