import 'package:flutter/material.dart';
import 'package:instantplus/mixins/safe_notifier_mixin.dart';
import 'package:instantplus/resources/navigator_resource.dart';
import 'package:instantplus/view/home/home_screen.dart';

class LoginViewModel extends ChangeNotifier with SafeNotifier {
  final formKey = GlobalKey<FormState>();
  final identifierController = TextEditingController();
  final List<TextEditingController> otpControllers =
      List.generate(5, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(5, (_) => FocusNode());

  bool showOtp = false;
  bool isLoading = false;

  String get identifier => identifierController.text.trim();

  Future<void> submitLogin() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    showOtp = true;
    isLoading = false;
    notifyListeners();
  }

  Future<void> submitOtp() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    isLoading = false;
    notifyListeners();
    RouteManager.navigateAndPopAll(const HomeScreen());
  }

  void onOtpChanged(int index, String value) {
    if (value.isNotEmpty && index < otpFocusNodes.length - 1) {
      otpFocusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }
  }

  @override
  void dispose() {
    identifierController.dispose();
    for (final c in otpControllers) {
      c.dispose();
    }
    for (final f in otpFocusNodes) {
      f.dispose();
    }
    super.dispose();
  }
}
