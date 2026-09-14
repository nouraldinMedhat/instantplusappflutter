import 'package:flutter/material.dart';
import 'package:instantplus/mixins/safe_notifier_mixin.dart';

/// Global user state — expand when InstantPlus profile API is ready.
class UserProvider with ChangeNotifier, SafeNotifier {
  bool visitor = false;
  int layout = 0;

  void setVisitor({required bool v}) {
    visitor = v;
    notifyListeners();
  }

  void setLayout(int v) {
    layout = v;
    notifyListeners();
  }

  Future<void> setUser() async {
    // Fetch profile / bootstrap data here.
    notifyListeners();
  }
}
