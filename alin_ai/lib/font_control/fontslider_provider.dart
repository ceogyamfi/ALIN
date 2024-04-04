import 'package:flutter/material.dart';

class FontSliderProvider with ChangeNotifier {
  double _value = 20;

  double get value => _value;

  void increment(double val) {
    _value = val;
    notifyListeners();
  }
}
