import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/demo_data.dart';
import 'package:instantplus/resources/strings_resources.dart';
import 'package:instantplus/reusable_components/faq_accordion.dart';
import 'package:instantplus/reusable_components/page_banner.dart';
import 'package:instantplus/reusable_components/plan_card.dart';
import 'package:instantplus/reusable_components/section_header.dart';
import 'package:instantplus/reusable_components/site_scaffold.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      title: StringsManager.packages,
      showBack: true,
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          const PageBanner(
            title: 'وصول غير محدود لكل الكورسات',
            subtitle: 'استثمر في نفسك بالسعر المناسب لك',
            badges: ['شهري', 'سنوي', 'وفر 40%'],
          ),
          SizedBox(height: 20.h),
          const SectionHeader(
            title: 'اختر خطتك',
            subtitle: 'كل المميزات بدون استثناء في الخطة الشهرية والسنوية',
            padding: EdgeInsets.zero,
          ),
          SizedBox(height: 14.h),
          ...DemoData.plans.map(
            (plan) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: PlanCard(plan: plan, width: null),
            ),
          ),
          SizedBox(height: 20.h),
          SectionHeader(
            title: 'الأسئلة الشائعة',
            padding: EdgeInsets.zero,
          ),
          SizedBox(height: 12.h),
          const FaqAccordion(items: DemoData.faqs),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
