import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/providers/cart_provider.dart';
import 'package:instantplus/resources/assets_resources.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/demo_data.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/navigator_resource.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/checklist_box.dart';
import 'package:instantplus/reusable_components/faq_accordion.dart';
import 'package:instantplus/reusable_components/page_banner.dart';
import 'package:instantplus/reusable_components/purchase_card.dart';
import 'package:instantplus/reusable_components/segment_tabs.dart';
import 'package:instantplus/reusable_components/site_scaffold.dart';
import 'package:instantplus/reusable_components/testimonial_card.dart';
import 'package:instantplus/reusable_components/text_widget.dart';
import 'package:instantplus/view/course_details/course_details_screen.dart';
import 'package:provider/provider.dart';

class BundleDetailsScreen extends StatefulWidget {
  final int bundleId;

  const BundleDetailsScreen({super.key, required this.bundleId});

  @override
  State<BundleDetailsScreen> createState() => _BundleDetailsScreenState();
}

class _BundleDetailsScreenState extends State<BundleDetailsScreen> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final bundle = DemoData.bundleById(widget.bundleId);
    final cart = context.read<CartProvider>();

    return SiteScaffold(
      title: 'تفاصيل الحزمة',
      showBack: true,
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          PageBanner(
            title: bundle.title,
            subtitle: bundle.description,
            image: AssetsResource.bannerImage,
            badges: [bundle.duration, bundle.coursesCount, '${bundle.studentsCount} طالب'],
          ),
          SizedBox(height: 16.h),
          PurchaseCard(
            title: 'الحزمة عبارة عن :',
            price: bundle.price,
            oldPrice: bundle.oldPrice,
            discount: bundle.discount,
            primaryAction: 'اشترك في الحزمة',
            secondaryAction: 'اضف للسلة',
            features: DemoData.courseFeatures,
            image: bundle.image,
            onPrimary: () => cart.addBundle(bundle),
            onSecondary: () => cart.addBundle(bundle),
          ),
          SizedBox(height: 20.h),
          SegmentTabs(
            tabs: DemoData.courseTabs,
            selectedIndex: _tab,
            onChanged: (i) => setState(() => _tab = i),
          ),
          SizedBox(height: 16.h),
          if (_tab == 0) ...[
            TextWidget(
              text: 'كورسات الحزمة',
              textStyle: getBoldStyle(fontSize: FontSize.regular),
            ),
            SizedBox(height: 10.h),
            ...bundle.courses.map(
              (item) => Container(
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: ColorsManager.basicBorder),
                ),
                child: ListTile(
                  onTap: () => RouteManager.navigateTo(
                    const CourseDetailsScreen(courseId: 6),
                  ),
                  title: TextWidget(
                    text: item.title,
                    maxLines: 2,
                    textStyle: getSemiBoldStyle(fontSize: FontSize.kindaSmall),
                  ),
                  subtitle: TextWidget(
                    text: '${item.duration} · ${item.lessonsCount} درس',
                    textStyle: getRegularStyle(
                      fontSize: FontSize.tinyText,
                      color: ColorsManager.hintColor,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_back_ios_new,
                      size: 14.sp, color: ColorsManager.primary),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            ChecklistBox(
              title: 'ماذا ستتعلم؟',
              items: DemoData.courseHighlights,
            ),
            SizedBox(height: 12.h),
            ChecklistBox(
              title: 'المتطلبات المسبقة',
              items: DemoData.coursePrerequisites,
            ),
          ] else if (_tab == 1) ...[
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: DemoData.testimonials.length,
                separatorBuilder: (_, _) => SizedBox(width: 12.w),
                itemBuilder: (context, index) =>
                    TestimonialCard(item: DemoData.testimonials[index]),
              ),
            ),
          ] else ...[
            const FaqAccordion(items: DemoData.faqs),
          ],
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
