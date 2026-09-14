import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/assets_resources.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/navigator_resource.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/site_drawer.dart';
import 'package:instantplus/reusable_components/text_widget.dart';
import 'package:instantplus/view/cart/cart_screen.dart';

class SiteScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final bool showBack;
  final List<Widget>? actions;
  final bool extendBodyBehindAppBar;

  const SiteScaffold({
    super.key,
    required this.body,
    this.title,
    this.showBack = false,
    this.actions,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.scaffold,
      endDrawer: const SiteDrawer(),
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        surfaceTintColor: ColorsManager.white,
        elevation: 0,
        centerTitle: false,
        leadingWidth: showBack ? 48.w : 0,
        leading: showBack
            ? IconButton(
                onPressed: () => RouteManager.pop(),
                icon: const Icon(Icons.arrow_back_ios_new, size: 18),
              )
            : const SizedBox.shrink(),
        title: title == null
            ? Image.asset(AssetsResource.logoBlue, height: 30.h)
            : TextWidget(
                text: title!,
                textStyle: getMediumStyle(fontSize: FontSize.mediumTitle),
              ),
        actions: [
          ...?actions,
          IconButton(
            onPressed: () => RouteManager.navigateTo(const CartScreen()),
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
          Builder(
            builder: (context) => Padding(
              padding: EdgeInsetsDirectional.only(end: 6.w),
              child: IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                style: IconButton.styleFrom(
                  backgroundColor: ColorsManager.lightPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                icon: Icon(
                  Icons.menu_rounded,
                  color: ColorsManager.primary,
                  size: 22.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: body,
    );
  }
}
