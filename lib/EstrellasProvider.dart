import 'package:flutter/foundation.dart';

class StarsProvider extends ChangeNotifier {
  int _stars = 0;

  int get stars => _stars;

  void setStars(int stars) {
    _stars = stars;
    notifyListeners();
  }
}