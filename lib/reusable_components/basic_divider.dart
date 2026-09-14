import 'package:flutter/material.dart';
import 'package:instantplus/resources/colors_resources.dart';

class BasicDivider extends StatelessWidget {
  final double height;
  final Color color;

  const BasicDivider({
    super.key,
    this.height = 1,
    this.color = ColorsManager.divider,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(height: height, thickness: height, color: color);
  }
}
