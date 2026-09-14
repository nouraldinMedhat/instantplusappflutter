import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/app_chip.dart';
import 'package:instantplus/reusable_components/text_widget.dart';

class PriceRow extends StatelessWidget {
  final String price;
  final String? oldPrice;
  final String? discount;
  final double priceSize;

  const PriceRow({
    super.key,
    required this.price,
    this.oldPrice,
    this.discount,
    this.priceSize = FontSize.kindaSmall,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8.w,
      children: [
        TextWidget(
          text: price,
          textStyle: getBoldStyle(
            fontSize: priceSize,
            color: ColorsManager.primary,
          ),
        ),
        if (oldPrice != null)
          Text(
            oldPrice!,
            style: getRegularStyle(
              fontSize: FontSize.tinyText,
              color: ColorsManager.hintColor,
            ).copyWith(decoration: TextDecoration.lineThrough),
          ),
        if (discount != null)
          AppChip(
            text: discount!,
            background: ColorsManager.accentGold.withValues(alpha: 0.15),
            textColor: ColorsManager.accentGold,
          ),
      ],
    );
  }
}
