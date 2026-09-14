import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/text_widget.dart';

class RegularButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color buttonColor;
  final Color fontColor;
  final double fontSize;
  final double borderRadius;
  final Color borderColor;
  final Widget? icon;
  final int height;
  final bool withGoldShadow;
  final bool outlined;

  const RegularButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 54,
    this.fontColor = Colors.white,
    this.buttonColor = ColorsManager.primary,
    this.fontSize = 15,
    this.borderRadius = 12,
    this.icon,
    this.borderColor = ColorsManager.primary,
    this.withGoldShadow = true,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        boxShadow: withGoldShadow && !outlined
            ? [
                BoxShadow(
                  color: ColorsManager.accentGold,
                  offset: Offset(0, 5.h),
                  blurRadius: 0,
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all<Color>(
            outlined ? ColorsManager.white : buttonColor,
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
              side: BorderSide(
                color: outlined ? ColorsManager.primary : borderColor,
                width: outlined ? 1.5 : 1,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: text,
              textAlign: TextAlign.center,
              textStyle: getSemiBoldStyle(
                fontSize: fontSize,
                color: outlined ? ColorsManager.primary : fontColor,
              ),
            ),
            if (icon != null) ...[
              SizedBox(width: 6.w),
              icon!,
            ],
          ],
        ),
      ),
    );
  }
}
