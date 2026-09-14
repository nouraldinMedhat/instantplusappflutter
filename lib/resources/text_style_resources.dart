import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/main.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';

double customScaleFactor() {
  if (isTablet == true) {
    return 0.67;
  }
  return 1.0;
}

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  Color color = ColorsManager.black,
}) {
  return TextStyle(
    fontSize: fontSize.sp * customScaleFactor(),
    fontWeight: fontWeight,
    fontFamily: FontResources.fontFamily,
    color: color,
  );
}

TextStyle getLightStyle({
  double fontSize = FontSize.tinyText,
  Color color = ColorsManager.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.light,
  );
}

TextStyle getMediumStyle({
  double fontSize = FontSize.regular,
  Color color = ColorsManager.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.medium,
  );
}

TextStyle getRegularStyle({
  double fontSize = FontSize.regular,
  Color color = ColorsManager.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
  );
}

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.regular,
  Color color = ColorsManager.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
  );
}

TextStyle getBoldStyle({
  double fontSize = FontSize.regular,
  Color color = ColorsManager.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.bold,
  );
}
