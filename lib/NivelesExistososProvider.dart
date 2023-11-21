import 'package:flutter/material.dart';

class NivelesExitososProvider with ChangeNotifier {
  Map<String, int> _nivelesExitosos = {};

  void setNivelesExitosos(String anime, int nivelesExitosos) {
    _nivelesExitosos[anime] = nivelesExitosos;
    notifyListeners();
  }

  int getNivelesExitosos(String anime) {
    return _nivelesExitosos[anime] ?? 0;
  }
}