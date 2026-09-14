import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/resources/values_resources.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    canvasColor: ColorsManager.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.primary,
      primary: ColorsManager.primary,
      secondary: ColorsManager.secondaryColor,
    ),
    scaffoldBackgroundColor: ColorsManager.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: getSemiBoldStyle(),
      unselectedLabelStyle: getLightStyle(),
    ),
    primaryColor: ColorsManager.primary,
    disabledColor: ColorsManager.grey,
    fontFamily: FontResources.fontFamily,
    cardTheme: CardThemeData(
      color: ColorsManager.white,
      shadowColor: ColorsManager.grey,
      elevation: AppSize.s4.r,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: ColorsManager.white,
      surfaceTintColor: ColorsManager.white,
      titleTextStyle: getSemiBoldStyle(fontSize: FontSize.subTitle),
      contentTextStyle: getRegularStyle(),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.white,
      titleTextStyle: TextStyle(fontFamily: FontResources.fontFamily),
      elevation: 0,
      iconTheme: const IconThemeData(color: ColorsManager.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getSemiBoldStyle(
          color: ColorsManager.white,
          fontSize: FontSize.kindaSmall,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12.r),
        ),
        shadowColor: ColorsManager.grey,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getLightStyle(
        color: ColorsManager.hintColor,
        fontSize: FontSize.tinyText.sp,
      ),
      labelStyle: getRegularStyle(
        color: ColorsManager.greyText,
        fontSize: FontSize.kindaSmall.sp,
      ),
      errorStyle: getLightStyle(color: ColorsManager.red),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: AppSize.s1_5.r),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.primary,
          width: AppSize.s1_5.r,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.red,
          width: AppSize.s1_5.r,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.primary,
          width: AppSize.s1_5.r,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),
    ),
  );
}
