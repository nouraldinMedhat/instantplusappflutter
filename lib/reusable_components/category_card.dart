import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/models.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/text_widget.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final double width;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.category,
    this.width = 130,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: ColorsManager.basicBorder),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(14.r)),
              child: Image.asset(
                category.image,
                height: 90.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Center(
                  child: TextWidget(
                    text: category.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    textStyle: getMediumStyle(
                      fontSize: FontSize.tinyText,
                      color: ColorsManager.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
