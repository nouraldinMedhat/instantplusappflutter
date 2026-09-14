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
import 'package:instantplus/view/bundle_details/bundle_details_screen.dart';

class BundleCard extends StatelessWidget {
  final BundleModel bundle;
  final double? width;

  const BundleCard({
    super.key,
    required this.bundle,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => RouteManager.navigateTo(
        BundleDetailsScreen(bundleId: bundle.id),
      ),
      child: Container(
        width: width?.w ?? double.infinity,
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
                bundle.image,
                height: 140.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: bundle.title,
                    textStyle: getBoldStyle(
                      fontSize: FontSize.regular,
                      color: ColorsManager.black,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  TextWidget(
                    text: bundle.description,
                    maxLines: 2,
                    textStyle: getRegularStyle(
                      fontSize: FontSize.tinyText,
                      color: ColorsManager.hintColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  PriceRow(
                    price: bundle.price,
                    oldPrice: bundle.oldPrice,
                    discount: bundle.discount,
                  ),
                  SizedBox(height: 10.h),
                  Wrap(
                    spacing: 6.w,
                    runSpacing: 6.h,
                    children: [
                      AppChip(text: bundle.duration),
                      AppChip(text: bundle.coursesCount),
                      AppChip(text: '${bundle.studentsCount} طالب'),
                      ...bundle.tags.take(2).map((t) => AppChip(text: t)),
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
