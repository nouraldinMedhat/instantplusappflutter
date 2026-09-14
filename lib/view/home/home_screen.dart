import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/assets_resources.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/demo_data.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/navigator_resource.dart';
import 'package:instantplus/resources/strings_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/bundle_card.dart';
import 'package:instantplus/reusable_components/category_card.dart';
import 'package:instantplus/reusable_components/course_card.dart';
import 'package:instantplus/reusable_components/horizontal_cards.dart';
import 'package:instantplus/reusable_components/plan_card.dart';
import 'package:instantplus/reusable_components/regular_button.dart';
import 'package:instantplus/reusable_components/section_header.dart';
import 'package:instantplus/reusable_components/segment_tabs.dart';
import 'package:instantplus/reusable_components/site_scaffold.dart';
import 'package:instantplus/reusable_components/testimonial_card.dart';
import 'package:instantplus/reusable_components/text_widget.dart';
import 'package:instantplus/view/bundles/bundles_screen.dart';
import 'package:instantplus/view/courses/courses_screen.dart';
import 'package:instantplus/view/packages/packages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _libraryTab = 0;

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 8.h)),
          SliverToBoxAdapter(child: _HeroSection()),
          SliverToBoxAdapter(child: SizedBox(height: 28.h)),
          SliverToBoxAdapter(child: _CategoriesBlock()),
          SliverToBoxAdapter(child: SizedBox(height: 28.h)),
          SliverToBoxAdapter(child: _CoursesLibraryBlock(
            selectedTab: _libraryTab,
            onTabChanged: (i) => setState(() => _libraryTab = i),
          )),
          SliverToBoxAdapter(child: SizedBox(height: 28.h)),
          SliverToBoxAdapter(child: _BundlesBlock()),
          SliverToBoxAdapter(child: SizedBox(height: 28.h)),
          SliverToBoxAdapter(child: _PlansBlock()),
          SliverToBoxAdapter(child: SizedBox(height: 28.h)),
          SliverToBoxAdapter(child: _TechPathBlock()),
          SliverToBoxAdapter(child: SizedBox(height: 28.h)),
          SliverToBoxAdapter(child: _TestimonialsBlock()),
          SliverToBoxAdapter(child: SizedBox(height: 28.h)),
          SliverToBoxAdapter(child: _CtaBanner()),
          SliverToBoxAdapter(child: SizedBox(height: 28.h)),
          SliverToBoxAdapter(child: _TechStackBlock()),
          SliverToBoxAdapter(child: SizedBox(height: 40.h)),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: Stack(
              children: [
                Image.asset(
                  AssetsResource.bgHero,
                  width: double.infinity,
                  height: 210.h,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 210.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        ColorsManager.primary.withValues(alpha: 0.88),
                        ColorsManager.blueMid.withValues(alpha: 0.55),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: ColorsManager.white.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: TextWidget(
                            text: StringsManager.heroBadge,
                            textStyle: getMediumStyle(
                              fontSize: FontSize.tinyText,
                              color: ColorsManager.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        TextWidget(
                          text: 'ابدأ رحلتك مع',
                          textStyle: getBoldStyle(
                            fontSize: FontSize.subTitle,
                            color: ColorsManager.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Image.asset(AssetsResource.logoWhite, height: 28.h),
                        const Spacer(),
                        TextWidget(
                          text: StringsManager.loginMediaBody,
                          maxLines: 2,
                          textStyle: getRegularStyle(
                            fontSize: FontSize.smallText,
                            color: ColorsManager.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          SizedBox(
            height: 150.h,
            child: PageView.builder(
              itemCount: DemoData.sliders.length,
              controller: PageController(viewportFraction: 0.88),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: Image.asset(
                      DemoData.sliders[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: RegularButton(
                  text: StringsManager.startLearning,
                  height: 46,
                  fontSize: FontSize.kindaSmall,
                  onPressed: () =>
                      RouteManager.navigateTo(const CoursesScreen()),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: RegularButton(
                  text: StringsManager.exploreCourses,
                  height: 46,
                  fontSize: FontSize.kindaSmall,
                  outlined: true,
                  withGoldShadow: false,
                  onPressed: () =>
                      RouteManager.navigateTo(const CoursesScreen()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoriesBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: StringsManager.categories,
          subtitle: StringsManager.categoriesSubtitle,
        ),
        SizedBox(height: 14.h),
        HorizontalCards(
          height: 150,
          itemCount: DemoData.categories.length,
          itemBuilder: (context, index) => CategoryCard(
            category: DemoData.categories[index],
            onTap: () => RouteManager.navigateTo(const CoursesScreen()),
          ),
        ),
      ],
    );
  }
}

class _CoursesLibraryBlock extends StatelessWidget {
  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  const _CoursesLibraryBlock({
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorsManager.scaffoldGrey,
      padding: EdgeInsets.symmetric(vertical: 22.h),
      child: Column(
        children: [
          SectionHeader(
            title: StringsManager.coursesLibrary,
            actionText: StringsManager.allCourses,
            onAction: () => RouteManager.navigateTo(const CoursesScreen()),
          ),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SegmentTabs(
              tabs: DemoData.libraryTabs,
              selectedIndex: selectedTab,
              onChanged: onTabChanged,
            ),
          ),
          SizedBox(height: 14.h),
          HorizontalCards(
            height: 250,
            itemCount: DemoData.courses.length,
            itemBuilder: (context, index) =>
                CourseCard(course: DemoData.courses[index]),
          ),
        ],
      ),
    );
  }
}

class _BundlesBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: StringsManager.courseBundles,
          actionText: 'عرض الكل',
          onAction: () => RouteManager.navigateTo(const BundlesScreen()),
        ),
        SizedBox(height: 14.h),
        HorizontalCards(
          height: 320,
          itemCount: DemoData.bundles.length,
          itemBuilder: (context, index) => BundleCard(
            bundle: DemoData.bundles[index],
            width: 280,
          ),
        ),
      ],
    );
  }
}

class _PlansBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 22.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorsManager.primary, ColorsManager.darkPrimary],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: StringsManager.packages,
                  textStyle: getBoldStyle(
                    fontSize: FontSize.mediumTitle,
                    color: ColorsManager.white,
                  ),
                ),
                SizedBox(height: 4.h),
                TextWidget(
                  text: 'كل المميزات بدون استثناء في الخطة الشهرية والسنوية',
                  maxLines: 2,
                  textStyle: getRegularStyle(
                    fontSize: FontSize.kindaSmall,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          HorizontalCards(
            height: 250,
            itemCount: DemoData.plans.length,
            itemBuilder: (context, index) => PlanCard(
              plan: DemoData.plans[index],
              onSubscribe: () =>
                  RouteManager.navigateTo(const PackagesScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechPathBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: StringsManager.techPath,
            padding: EdgeInsets.zero,
          ),
          SizedBox(height: 14.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              AssetsResource.slider2,
              height: 180.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(child: _StatCard(title: '30+', subtitle: 'كورساً')),
              SizedBox(width: 10.w),
              Expanded(
                child: _StatCard(
                  title: 'مدرّبون',
                  subtitle: 'محترفون',
                  color: ColorsManager.greenColor,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _StatCard(
                  title: 'مشاريع',
                  subtitle: 'عملية',
                  color: ColorsManager.accentGold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const _StatCard({
    required this.title,
    required this.subtitle,
    this.color = ColorsManager.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          TextWidget(
            text: title,
            textStyle: getBoldStyle(fontSize: FontSize.regular, color: color),
          ),
          SizedBox(height: 4.h),
          TextWidget(
            text: subtitle,
            textStyle: getRegularStyle(
              fontSize: FontSize.tinyText,
              color: ColorsManager.greyText,
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialsBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: StringsManager.successStories),
        SizedBox(height: 14.h),
        HorizontalCards(
          height: 200,
          itemCount: DemoData.testimonials.length,
          itemBuilder: (context, index) =>
              TestimonialCard(item: DemoData.testimonials[index]),
        ),
      ],
    );
  }
}

class _CtaBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.r),
        child: Stack(
          children: [
            Image.asset(
              AssetsResource.imageBanner,
              width: double.infinity,
              height: 180.h,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: 180.h,
              color: ColorsManager.primary.withValues(alpha: 0.72),
            ),
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.all(18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: StringsManager.readyBanner,
                      maxLines: 3,
                      textStyle: getBoldStyle(
                        fontSize: FontSize.mediumTitle,
                        color: ColorsManager.white,
                      ),
                    ),
                    const Spacer(),
                    RegularButton(
                      text: StringsManager.startLearning,
                      height: 44,
                      fontSize: FontSize.kindaSmall,
                      buttonColor: ColorsManager.white,
                      fontColor: ColorsManager.primary,
                      borderColor: ColorsManager.white,
                      withGoldShadow: false,
                      onPressed: () =>
                          RouteManager.navigateTo(const CoursesScreen()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechStackBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: StringsManager.techStack),
        SizedBox(height: 14.h),
        SizedBox(
          height: 56.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: DemoData.techIcons.length,
            separatorBuilder: (_, _) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              return Container(
                width: 56.w,
                height: 56.w,
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: ColorsManager.basicBorder),
                ),
                child: Image.asset(DemoData.techIcons[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
