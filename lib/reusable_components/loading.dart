import 'package:flutter/material.dart';
import 'package:instantplus/resources/colors_resources.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: ColorsManager.primary,
    );
  }
}
