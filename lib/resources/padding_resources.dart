import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/navigator_resource.dart';

class PaddingResources {
  static double _safeBottom = 0;
  static double _safeTop = 0;
  static bool _inited = false;

  static double get safeBottom {
    final context = navigatorKey.currentContext;
    if (context != null) {
      final mq = MediaQuery.maybeOf(context);
      if (mq != null && mq.viewPadding.bottom > 0) {
        _safeBottom = mq.viewPadding.bottom;
      }
    }
    return _safeBottom;
  }

  static double get safeTop {
    final context = navigatorKey.currentContext;
    if (context != null) {
      final mq = MediaQuery.maybeOf(context);
      if (mq != null && mq.viewPadding.top > 0) {
        _safeTop = mq.viewPadding.top;
      }
    }
    return _safeTop;
  }

  static void init() {
    if (_inited) return;
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    final mq = MediaQueryData.fromView(view);
    _safeBottom = mq.viewPadding.bottom;
    _safeTop = mq.viewPadding.top;
    _inited = true;
  }
}

EdgeInsets get bottomButtonPadding => EdgeInsets.only(
      right: 16.w,
      left: 16.w,
      bottom: PaddingResources.safeBottom + (Platform.isIOS ? 0 : 8.h),
      top: 16.h,
    );

EdgeInsets get modalSheetPadding => EdgeInsets.only(
      right: 16.w,
      left: 16.w,
      bottom: PaddingResources.safeBottom,
      top: 25.h,
    );

EdgeInsets get modalSheetWithActionPadding => EdgeInsets.only(
      right: 16.w,
      left: 16.w,
      bottom: 0,
      top: 25.h,
    );
