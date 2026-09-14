import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/models.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/text_widget.dart';

class TestimonialCard extends StatelessWidget {
  final TestimonialModel item;
  final double width;

  const TestimonialCard({
    super.key,
    required this.item,
    this.width = 260,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: ColorsManager.basicBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
              (i) => Icon(
                Icons.star,
                size: 16.sp,
                color: i < item.rating
                    ? ColorsManager.yellow
                    : ColorsManager.basicBorder,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: TextWidget(
              text: item.quote,
              maxLines: 5,
              textStyle: getRegularStyle(
                fontSize: FontSize.kindaSmall,
                color: ColorsManager.greyText,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          TextWidget(
            text: item.name,
            textStyle: getSemiBoldStyle(
              fontSize: FontSize.kindaSmall,
              color: ColorsManager.black,
            ),
          ),
          SizedBox(height: 2.h),
          TextWidget(
            text: item.diploma,
            textStyle: getRegularStyle(
              fontSize: FontSize.tinyText,
              color: ColorsManager.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
