import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/text_widget.dart';

class AppChip extends StatelessWidget {
  final String text;
  final Color? background;
  final Color? textColor;
  final bool selected;
  final VoidCallback? onTap;

  const AppChip({
    super.key,
    required this.text,
    this.background,
    this.textColor,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = background ??
        (selected ? ColorsManager.primary : ColorsManager.lightPrimary);
    final fg = textColor ??
        (selected ? ColorsManager.white : ColorsManager.primary);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: TextWidget(
          text: text,
          textStyle: getMediumStyle(fontSize: FontSize.tinyText, color: fg),
        ),
      ),
    );
  }
}
