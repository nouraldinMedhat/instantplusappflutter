import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/assets_resources.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/view_model/splash_view_model/splash_view_model.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashViewModel()..start(),
      builder: (context, _) {
        final splashViewModel = context.read<SplashViewModel>();
        return Scaffold(
          backgroundColor: ColorsManager.white,
          body: Center(
            child: FadeTransition(
              opacity: splashViewModel.fade,
              child: Image.asset(
                AssetsResource.logoBlue,
                width: 220.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
