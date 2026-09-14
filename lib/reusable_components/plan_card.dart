import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/models.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/app_chip.dart';
import 'package:instantplus/reusable_components/price_row.dart';
import 'package:instantplus/reusable_components/regular_button.dart';
import 'package:instantplus/reusable_components/text_widget.dart';

class PlanCard extends StatelessWidget {
  final PlanModel plan;
  final VoidCallback? onSubscribe;
  final double? width;

  const PlanCard({
    super.key,
    required this.plan,
    this.onSubscribe,
    this.width = 240,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.basicBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextWidget(
                text: plan.title,
                textStyle: getBoldStyle(
                  fontSize: FontSize.regular,
                  color: ColorsManager.black,
                ),
              ),
              if (plan.discount != null) ...[
                SizedBox(width: 8.w),
                AppChip(
                  text: plan.discount!,
                  background: ColorsManager.accentGold.withValues(alpha: 0.15),
                  textColor: ColorsManager.accentGold,
                ),
              ],
            ],
          ),
          SizedBox(height: 12.h),
          PriceRow(
            price: plan.price,
            oldPrice: plan.oldPrice,
            priceSize: FontSize.mediumTitle,
          ),
          SizedBox(height: 14.h),
          ...plan.features.map(
            (f) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  Icon(Icons.check_circle,
                      size: 16.sp, color: ColorsManager.greenColor),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: TextWidget(
                      text: f,
                      maxLines: 2,
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
          SizedBox(height: 8.h),
          RegularButton(
            text: 'اشترك الآن',
            height: 44,
            fontSize: FontSize.kindaSmall,
            onPressed: onSubscribe ?? () {},
          ),
        ],
      ),
    );
  }
}
