import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/app_chip.dart';
import 'package:instantplus/reusable_components/text_widget.dart';

class PageBanner extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<String> badges;
  final String? image;

  const PageBanner({
    super.key,
    required this.title,
    this.subtitle,
    this.badges = const [],
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Stack(
        children: [
          if (image != null)
            Image.asset(
              image!,
              width: double.infinity,
              height: 180.h,
              fit: BoxFit.cover,
            )
          else
            Container(
              width: double.infinity,
              height: 180.h,
              color: ColorsManager.primary,
            ),
          Container(
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  ColorsManager.primary.withValues(alpha: 0.92),
                  ColorsManager.blueMid.withValues(alpha: 0.75),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: title,
                    maxLines: 2,
                    textStyle: getBoldStyle(
                      fontSize: FontSize.subTitle,
                      color: ColorsManager.white,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 8.h),
                    TextWidget(
                      text: subtitle!,
                      maxLines: 3,
                      textStyle: getRegularStyle(
                        fontSize: FontSize.kindaSmall,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                  const Spacer(),
                  if (badges.isNotEmpty)
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: badges
                          .map(
                            (b) => AppChip(
                              text: b,
                              background:
                                  ColorsManager.white.withValues(alpha: 0.15),
                              textColor: ColorsManager.white,
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
