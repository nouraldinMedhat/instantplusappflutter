import 'package:flutter/material.dart';
import 'package:instantplus/resources/navigator_resource.dart';
import 'package:instantplus/reusable_components/loading.dart';

class LoadingOverlay {
  static OverlayEntry? _overlayEntry;
  static DateTime? _startTime;

  static void show() {
    if (_overlayEntry != null) return;

    _startTime = DateTime.now();
    final overlay = Overlay.of(navigatorKey.currentContext!, rootOverlay: true);

    _overlayEntry = OverlayEntry(
      builder: (_) => const Stack(
        children: [
          ModalBarrier(
            color: Colors.black38,
            dismissible: false,
          ),
          Center(child: Loading()),
        ],
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  static Future<void> hide() async {
    if (_overlayEntry == null) return;

    final elapsedTime = DateTime.now().difference(_startTime!).inMilliseconds;
    const minDuration = 0;

    if (elapsedTime < minDuration) {
      await Future.delayed(Duration(milliseconds: minDuration - elapsedTime));
    }

    _overlayEntry?.remove();
    _overlayEntry = null;
    _startTime = null;
  }
}
