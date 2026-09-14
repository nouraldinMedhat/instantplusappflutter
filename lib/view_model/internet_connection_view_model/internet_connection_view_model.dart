import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:instantplus/mixins/safe_notifier_mixin.dart';

class InternetConnectionViewModel
    with ChangeNotifier, SafeNotifier, WidgetsBindingObserver {
  bool isConnected = true;
  final InternetConnectionChecker _checker =
      InternetConnectionChecker.createInstance();
  StreamSubscription<InternetConnectionStatus>? _subscription;
  bool _handledInitialStatus = false;

  InternetConnectionViewModel() {
    WidgetsBinding.instance.addObserver(this);
    _subscription = _checker.onStatusChange.listen((status) {
      setConnected(status == InternetConnectionStatus.connected);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _subscription?.resume();
      checkConnectionManually();
    } else if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      _subscription?.pause();
    } else if (state == AppLifecycleState.detached) {
      _subscription?.cancel();
    }
  }

  Future<void> checkConnectionManually() async {
    try {
      final bool result = await _checker.hasConnection;
      setConnected(result);
    } catch (_) {
      setConnected(false);
    }
  }

  void setConnected(bool v) {
    if (!_handledInitialStatus) {
      _handledInitialStatus = true;
      if (!v) return;
    }
    if (isConnected == v) return;
    isConnected = v;
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _subscription?.cancel();
    super.dispose();
  }
}
