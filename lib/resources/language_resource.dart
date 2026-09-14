import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:instantplus/resources/navigator_resource.dart';
import 'package:instantplus/resources/shared_pref.dart';
import 'package:instantplus/view/intro/splash.dart';

class LanguageResource {
  static String get languageCode =>
      navigatorKey.currentContext!.locale.languageCode;

  static bool get isArabic =>
      navigatorKey.currentContext!.locale.languageCode == 'ar';

  static void changeToArabic({bool restart = false}) {
    if (!isArabic) {
      SharedPrefUtils.setLanguage('ar');
      navigatorKey.currentContext!.setLocale(const Locale('ar'));
    }

    if (restart) {
      RouteManager.navigateAndPopAll(const Splash());
    }
  }

  static void changeToEnglish({bool restart = false}) {
    if (isArabic) {
      SharedPrefUtils.setLanguage('en');
      navigatorKey.currentContext!.setLocale(const Locale('en'));
    }

    if (restart) {
      RouteManager.navigateAndPopAll(const Splash());
    }
  }
}
