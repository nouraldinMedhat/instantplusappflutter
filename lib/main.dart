import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/providers/cart_provider.dart';
import 'package:instantplus/providers/user_provider.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/constants.dart';
import 'package:instantplus/resources/error_handler.dart';
import 'package:instantplus/resources/navigator_resource.dart';
import 'package:instantplus/resources/padding_resources.dart';
import 'package:instantplus/resources/themes_resources.dart';
import 'package:instantplus/view/intro/splash.dart';
import 'package:instantplus/view_model/internet_connection_view_model/internet_connection_view_model.dart';
import 'package:provider/provider.dart';

bool? isTablet;

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    ErrorHandler.setUpGlobalErrorHandler();
    PaddingResources.init();
    await EasyLocalization.ensureInitialized();

    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        startLocale: const Locale('ar'),
        saveLocale: true,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserProvider()),
            ChangeNotifierProvider(create: (_) => CartProvider()),
            ChangeNotifierProvider(
              create: (_) => InternetConnectionViewModel(),
            ),
          ],
          child: const MyApp(),
        ),
      ),
    );
  }, (error, stackTrace) {
    ErrorHandler.reportError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    isTablet = MediaQuery.of(context).size.width > 600;

    return ScreenUtilInit(
      designSize: const Size(375, 810),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.noScaling,
              ),
              child: Overlay(
                initialEntries: [
                  OverlayEntry(
                    builder: (context) =>
                        LayoutTemplate(child: child ?? const SizedBox()),
                  ),
                ],
              ),
            );
          },
          navigatorKey: navigatorKey,
          color: ColorsManager.primary,
          home: const Splash(),
          title: kAppNameAr,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
        );
      },
    );
  }
}

class LayoutTemplate extends StatelessWidget {
  final Widget child;

  const LayoutTemplate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Column(
        children: [Expanded(child: child)],
      ),
    );
  }
}
