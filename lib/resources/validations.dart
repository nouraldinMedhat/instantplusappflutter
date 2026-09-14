import 'package:easy_localization/easy_localization.dart';

class Validations {
  static String? validateName(String? v) {
    if (v == null || v.isEmpty) {
      return 'حقل الاسم مطلوب'.tr();
    }
    return null;
  }

  static String? validateField(String? v) {
    if (v == null || v.isEmpty) {
      return 'هذا الحقل مطلوب'.tr();
    }
    return null;
  }

  static String? validateEmail(String? v) {
    if (v == null || v.isEmpty) {
      return 'حقل البريد الإلكتروني مطلوب'.tr();
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(v)) {
      return 'البريد الإلكتروني غير صالح'.tr();
    }
    return null;
  }

  static String? validatePhoneNumber(String? number) {
    if (number == null || number.isEmpty) {
      return 'حقل رقم الهاتف مطلوب'.tr();
    }
    if (number.length < 9) {
      return 'رقم الهاتف غير صالح'.tr();
    }
    return null;
  }

  static String? validatePassword(String? v) {
    if (v == null || v.isEmpty) {
      return 'حقل كلمة المرور مطلوب'.tr();
    }
    if (v.length < 6) {
      return 'كلمة المرور قصيرة جداً'.tr();
    }
    return null;
  }
}
