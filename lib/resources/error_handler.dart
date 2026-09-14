import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instantplus/network/dio.dart';
import 'package:instantplus/resources/loading_overlay.dart';

class ErrorHandler {
  static Future<void> reportError(
    dynamic exception,
    StackTrace? stackTrace,
  ) async {
    debugPrint('${LogColor.red} ❌$exception');
    debugPrint('${LogColor.red} ❌$stackTrace ${LogColor.reset}');
    await LoadingOverlay.hide();
  }

  static void setUpGlobalErrorHandler() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return const SizedBox.shrink();
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      return true;
    };

    FlutterError.onError = (FlutterErrorDetails details) async {
      await reportError(details.exception, details.stack);
    };
  }
}
