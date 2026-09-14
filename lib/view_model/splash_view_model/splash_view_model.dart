import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:instantplus/mixins/safe_notifier_mixin.dart';
import 'package:instantplus/resources/navigator_resource.dart';
import 'package:instantplus/resources/shared_pref.dart';
import 'package:instantplus/view/auth/login.dart';

class SplashViewModel extends ChangeNotifier
    with SafeNotifier
    implements TickerProvider {
  SplashViewModel() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  late final AnimationController _controller;
  late final Animation<double> fade;
  final Set<Ticker> _tickers = {};

  @override
  Ticker createTicker(TickerCallback onTick) {
    final ticker = _SplashTicker(onTick, _removeTicker);
    _tickers.add(ticker);
    return ticker;
  }

  void _removeTicker(Ticker ticker) => _tickers.remove(ticker);

  Future<void> start() async {
    if (await SharedPrefUtils.getLanguage() == null) {
      await SharedPrefUtils.setLanguage('ar');
    }

    await _controller.forward();
    await Future.delayed(const Duration(milliseconds: 400));

    final context = navigatorKey.currentContext;
    if (context == null || !context.mounted) return;
    RouteManager.navigateAndPopAll(const LoginScreen());
  }

  @override
  void dispose() {
    _controller.dispose();
    for (final ticker in _tickers.toList()) {
      ticker.dispose();
    }
    super.dispose();
  }
}

class _SplashTicker extends Ticker {
  _SplashTicker(super.onTick, this._onDispose);

  final void Function(Ticker) _onDispose;

  @override
  void dispose() {
    _onDispose(this);
    super.dispose();
  }
}
