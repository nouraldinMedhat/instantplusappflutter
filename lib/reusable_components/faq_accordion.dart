import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/models.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/text_widget.dart';

class FaqAccordion extends StatelessWidget {
  final List<FaqModel> items;

  const FaqAccordion({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => Container(
              margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: ColorsManager.basicBorder),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 14.w),
                  childrenPadding:
                      EdgeInsets.fromLTRB(14.w, 0, 14.w, 14.h),
                  title: TextWidget(
                    text: item.question,
                    maxLines: 2,
                    textStyle: getSemiBoldStyle(
                      fontSize: FontSize.kindaSmall,
                      color: ColorsManager.black,
                    ),
                  ),
                  children: [
                    TextWidget(
                      text: item.answer,
                      maxLines: 8,
                      textStyle: getRegularStyle(
                        fontSize: FontSize.kindaSmall,
                        color: ColorsManager.greyText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
