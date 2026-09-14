import 'package:flutter/material.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/navigator_resource.dart';

void showToast(String message) {
  final context = navigatorKey.currentContext;
  if (context == null) return;

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: ColorsManager.secondaryColor,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
