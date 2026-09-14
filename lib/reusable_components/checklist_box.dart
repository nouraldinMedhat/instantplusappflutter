import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/text_widget.dart';

class ChecklistBox extends StatelessWidget {
  final String title;
  final List<String> items;

  const ChecklistBox({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: ColorsManager.lightPrimary,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: title,
            textStyle: getBoldStyle(
              fontSize: FontSize.regular,
              color: ColorsManager.black,
            ),
          ),
          SizedBox(height: 10.h),
          ...items.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle,
                      size: 18.sp, color: ColorsManager.primary),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextWidget(
                      text: item,
                      maxLines: 3,
                      textStyle: getRegularStyle(
                        fontSize: FontSize.kindaSmall,
                        color: ColorsManager.greyText,
                      ),
                    ),
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
