import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/assets_resources.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/navigator_resource.dart';
import 'package:instantplus/resources/strings_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/text_widget.dart';
import 'package:instantplus/view/auth/login.dart';
import 'package:instantplus/view/bundles/bundles_screen.dart';
import 'package:instantplus/view/cart/cart_screen.dart';
import 'package:instantplus/view/courses/courses_screen.dart';
import 'package:instantplus/view/home/home_screen.dart';
import 'package:instantplus/view/packages/packages_screen.dart';

class SiteDrawer extends StatefulWidget {
  const SiteDrawer({super.key});

  @override
  State<SiteDrawer> createState() => _SiteDrawerState();
}

class _SiteDrawerState extends State<SiteDrawer> {
  bool _coursesExpanded = false;

  void _go(Widget page) {
    Navigator.pop(context);
    RouteManager.navigateTo(page);
  }

  void _replace(Widget page) {
    Navigator.pop(context);
    RouteManager.navigateAndPopAll(page);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 0.82;

    return Drawer(
      width: width.clamp(300.0, 360.0),
      backgroundColor: ColorsManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(28.r),
          bottomStart: Radius.circular(28.r),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _DrawerHeader(onClose: () => Navigator.pop(context)),
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
                children: [
                  _SectionLabel(text: 'استكشف'),
                  SizedBox(height: 8.h),
                  _NavItem(
                    title: 'الرئيسية',
                    icon: Icons.home_rounded,
                    onTap: () => _replace(const HomeScreen()),
                  ),
                  _ExpandableNav(
                    title: 'الكورسات',
                    icon: Icons.menu_book_rounded,
                    expanded: _coursesExpanded,
                    onToggle: () =>
                        setState(() => _coursesExpanded = !_coursesExpanded),
                    children: [
                      _SubNavItem(
                        title: 'كل الكورسات',
                        onTap: () => _go(const CoursesScreen()),
                      ),
                      _SubNavItem(
                        title: 'لغات',
                        onTap: () =>
                            _go(const CoursesScreen(initialTab: 'لغات')),
                      ),
                      _SubNavItem(
                        title: 'تطوير الخوادم',
                        onTap: () => _go(
                          const CoursesScreen(initialTab: 'تطوير الخوادم'),
                        ),
                      ),
                      _SubNavItem(
                        title: 'أمن سيبراني',
                        onTap: () => _go(
                          const CoursesScreen(initialTab: 'أمن سيبراني'),
                        ),
                      ),
                      _SubNavItem(
                        title: 'الذكاء الاصطناعي',
                        onTap: () => _go(const CoursesScreen(initialTab: 'AI')),
                      ),
                      _SubNavItem(
                        title: 'التصميم وتجربة المستخدم',
                        onTap: () =>
                            _go(const CoursesScreen(initialTab: 'التصميم')),
                      ),
                    ],
                  ),
                  _NavItem(
                    title: 'حزم الكورسات',
                    icon: Icons.layers_rounded,
                    onTap: () => _go(const BundlesScreen()),
                  ),
                  _NavItem(
                    title: 'الباقات',
                    icon: Icons.workspace_premium_rounded,
                    accent: true,
                    onTap: () => _go(const PackagesScreen()),
                  ),
                  SizedBox(height: 18.h),
                  _SectionLabel(text: 'حسابك'),
                  SizedBox(height: 8.h),
                  _NavItem(
                    title: 'السلة',
                    icon: Icons.shopping_bag_outlined,
                    onTap: () => _go(const CartScreen()),
                  ),
                ],
              ),
            ),
            _DrawerFooter(
              onLogin: () => _go(const LoginScreen()),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  final VoidCallback onClose;

  const _DrawerHeader({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 4.h),
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 12.w, 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColorsManager.primary,
            ColorsManager.blueMid,
            Color(0xff1A3A9C),
          ],
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: ColorsManager.white.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(
              AssetsResource.logoWhite,
              height: 22.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: StringsManager.appNameAr,
                  textStyle: getBoldStyle(
                    fontSize: FontSize.regular,
                    color: ColorsManager.white,
                  ),
                ),
                SizedBox(height: 2.h),
                TextWidget(
                  text: 'Learn. Build. Grow.',
                  textStyle: getRegularStyle(
                    fontSize: FontSize.tinyText,
                    color: ColorsManager.white.withValues(alpha: 0.75),
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: ColorsManager.white.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(12.r),
            child: InkWell(
              onTap: onClose,
              borderRadius: BorderRadius.circular(12.r),
              child: SizedBox(
                width: 40.w,
                height: 40.w,
                child: Icon(
                  Icons.close_rounded,
                  color: ColorsManager.white,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 6.w, bottom: 2.h),
      child: TextWidget(
        text: text.toUpperCase(),
        textStyle: getSemiBoldStyle(
          fontSize: FontSize.tinyText,
          color: ColorsManager.hintColor,
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool accent;

  const _NavItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.accent = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconBg = accent
        ? ColorsManager.accentGold.withValues(alpha: 0.14)
        : ColorsManager.lightPrimary;
    final iconColor =
        accent ? ColorsManager.accentGold : ColorsManager.primary;

    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(icon, color: iconColor, size: 20.sp),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: TextWidget(
                    text: title,
                    textStyle: getMediumStyle(
                      fontSize: FontSize.regular,
                      color: ColorsManager.black,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_left_rounded,
                  color: ColorsManager.unSelectedColor,
                  size: 22.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExpandableNav extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool expanded;
  final VoidCallback onToggle;
  final List<Widget> children;

  const _ExpandableNav({
    required this.title,
    required this.icon,
    required this.expanded,
    required this.onToggle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Column(
        children: [
          Material(
            color: expanded
                ? ColorsManager.lightPrimary.withValues(alpha: 0.65)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(14.r),
            child: InkWell(
              onTap: onToggle,
              borderRadius: BorderRadius.circular(14.r),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: ColorsManager.lightPrimary,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(icon,
                          color: ColorsManager.primary, size: 20.sp),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: TextWidget(
                        text: title,
                        textStyle: getMediumStyle(
                          fontSize: FontSize.regular,
                          color: ColorsManager.black,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: ColorsManager.primary,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 4.h, bottom: 4.h),
              padding: EdgeInsetsDirectional.only(
                start: 12.w,
                end: 4.w,
                top: 4.h,
                bottom: 4.h,
              ),
              decoration: BoxDecoration(
                color: ColorsManager.tabsScaffold,
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: ColorsManager.basicBorder),
              ),
              child: Column(children: children),
            ),
            crossFadeState: expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 220),
          ),
        ],
      ),
    );
  }
}

class _SubNavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _SubNavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 11.h),
        child: Row(
          children: [
            Container(
              width: 6.w,
              height: 6.w,
              decoration: const BoxDecoration(
                color: ColorsManager.primary,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: TextWidget(
                text: title,
                textStyle: getRegularStyle(
                  fontSize: FontSize.kindaSmall,
                  color: ColorsManager.greyText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerFooter extends StatelessWidget {
  final VoidCallback onLogin;

  const _DrawerFooter({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        border: Border(
          top: BorderSide(color: ColorsManager.basicBorder),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: onLogin,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorsManager.primary,
                foregroundColor: ColorsManager.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_forward_rounded, size: 18.sp),
                  SizedBox(width: 8.w),
                  TextWidget(
                    text: StringsManager.login,
                    textStyle: getSemiBoldStyle(
                      fontSize: FontSize.regular,
                      color: ColorsManager.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          TextWidget(
            text: 'Instant Plus · منصة تعليمية تقنية',
            textAlign: TextAlign.center,
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
