import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/text_widget.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? actionText;
  final VoidCallback? onAction;
  final EdgeInsetsGeometry? padding;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onAction,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  textStyle: getBoldStyle(
                    fontSize: FontSize.mediumTitle,
                    color: ColorsManager.black,
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(height: 4.h),
                  TextWidget(
                    text: subtitle!,
                    maxLines: 2,
                    textStyle: getRegularStyle(
                      fontSize: FontSize.kindaSmall,
                      color: ColorsManager.hintColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (actionText != null)
            GestureDetector(
              onTap: onAction,
              child: TextWidget(
                text: actionText!,
                textStyle: getSemiBoldStyle(
                  fontSize: FontSize.kindaSmall,
                  color: ColorsManager.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
