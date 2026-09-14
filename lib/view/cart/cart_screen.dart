import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/providers/cart_provider.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/strings_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/regular_button.dart';
import 'package:instantplus/reusable_components/site_scaffold.dart';
import 'package:instantplus/reusable_components/text_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return SiteScaffold(
      title: StringsManager.cart,
      showBack: true,
      body: cart.items.isEmpty
          ? Center(
              child: TextWidget(
                text: 'السلة فارغة حالياً',
                textStyle: getMediumStyle(
                  fontSize: FontSize.regular,
                  color: ColorsManager.hintColor,
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16.w),
                    itemCount: cart.items.length,
                    separatorBuilder: (_, _) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: ColorsManager.white,
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(color: ColorsManager.basicBorder),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                item.image,
                                width: 72.w,
                                height: 72.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: item.title,
                                    maxLines: 2,
                                    textStyle: getSemiBoldStyle(
                                      fontSize: FontSize.kindaSmall,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  TextWidget(
                                    text: item.subtitle,
                                    textStyle: getRegularStyle(
                                      fontSize: FontSize.tinyText,
                                      color: ColorsManager.hintColor,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  TextWidget(
                                    text: item.price,
                                    textStyle: getBoldStyle(
                                      fontSize: FontSize.kindaSmall,
                                      color: ColorsManager.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () => cart.removeAt(index),
                              icon: const Icon(Icons.delete_outline,
                                  color: ColorsManager.red),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 20.h),
                  child: RegularButton(
                    text: 'إتمام الشراء',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
    );
  }
}
