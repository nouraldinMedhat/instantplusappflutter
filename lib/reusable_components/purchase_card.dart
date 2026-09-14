import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/models.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/price_row.dart';
import 'package:instantplus/reusable_components/regular_button.dart';
import 'package:instantplus/reusable_components/text_widget.dart';

class PurchaseCard extends StatelessWidget {
  final String title;
  final String price;
  final String oldPrice;
  final String? discount;
  final String primaryAction;
  final String secondaryAction;
  final List<CourseFeatureModel> features;
  final VoidCallback? onPrimary;
  final VoidCallback? onSecondary;
  final String? image;

  const PurchaseCard({
    super.key,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.primaryAction,
    required this.secondaryAction,
    required this.features,
    this.discount,
    this.onPrimary,
    this.onSecondary,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.basicBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                image!,
                height: 140.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          if (image != null) SizedBox(height: 12.h),
          TextWidget(
            text: title,
            textStyle: getSemiBoldStyle(
              fontSize: FontSize.regular,
              color: ColorsManager.black,
            ),
          ),
          SizedBox(height: 10.h),
          PriceRow(
            price: price,
            oldPrice: oldPrice,
            discount: discount,
            priceSize: FontSize.mediumTitle,
          ),
          SizedBox(height: 14.h),
          RegularButton(
            text: primaryAction,
            height: 46,
            fontSize: FontSize.kindaSmall,
            onPressed: onPrimary ?? () {},
          ),
          SizedBox(height: 10.h),
          RegularButton(
            text: secondaryAction,
            height: 46,
            fontSize: FontSize.kindaSmall,
            outlined: true,
            withGoldShadow: false,
            onPressed: onSecondary ?? () {},
          ),
          SizedBox(height: 14.h),
          ...features.map(
            (f) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  Icon(Icons.check,
                      size: 16.sp, color: ColorsManager.primary),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextWidget(
                      text: f.value.isEmpty ? f.label : '${f.value} ${f.label}',
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
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: ColorsManager.lightPrimary,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: TextWidget(
              text: 'تحب تطمن أكتر؟ استرداد كامل بعد أول محاضرتين.',
              maxLines: 2,
              textStyle: getMediumStyle(
                fontSize: FontSize.tinyText,
                color: ColorsManager.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
