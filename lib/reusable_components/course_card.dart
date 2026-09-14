import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/models.dart';
import 'package:instantplus/resources/navigator_resource.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/app_chip.dart';
import 'package:instantplus/reusable_components/price_row.dart';
import 'package:instantplus/reusable_components/text_widget.dart';
import 'package:instantplus/view/course_details/course_details_screen.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  final double? width;

  const CourseCard({
    super.key,
    required this.course,
    this.width = 190,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => RouteManager.navigateTo(
        CourseDetailsScreen(courseId: course.id),
      ),
      child: Container(
        width: width?.w,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: ColorsManager.basicBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(14.r)),
              child: Image.asset(
                course.image,
                height: 110.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: course.title,
                    maxLines: 2,
                    textStyle: getSemiBoldStyle(
                      fontSize: FontSize.kindaSmall,
                      color: ColorsManager.black,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  TextWidget(
                    text: course.instructor,
                    textStyle: getRegularStyle(
                      fontSize: FontSize.tinyText,
                      color: ColorsManager.hintColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  PriceRow(price: course.price, oldPrice: course.oldPrice),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      AppChip(text: course.duration),
                      SizedBox(width: 6.w),
                      AppChip(text: course.level),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
