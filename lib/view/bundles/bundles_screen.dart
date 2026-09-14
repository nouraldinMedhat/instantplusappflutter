import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/demo_data.dart';
import 'package:instantplus/resources/strings_resources.dart';
import 'package:instantplus/reusable_components/bundle_card.dart';
import 'package:instantplus/reusable_components/page_banner.dart';
import 'package:instantplus/reusable_components/site_scaffold.dart';

class BundlesScreen extends StatelessWidget {
  const BundlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      title: StringsManager.courseBundles,
      showBack: true,
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          const PageBanner(
            title: 'حزم الكورسات',
            subtitle: 'مسارات متكاملة بأسعار أوفر وتغطية أشمل لمهاراتك',
            badges: ['وفر أكثر', '5 كورسات في حزمة'],
          ),
          SizedBox(height: 16.h),
          ...DemoData.bundles.map(
            (bundle) => Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: BundleCard(bundle: bundle),
            ),
          ),
        ],
      ),
    );
  }
}
