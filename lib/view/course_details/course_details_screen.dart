import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/providers/cart_provider.dart';
import 'package:instantplus/resources/assets_resources.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/demo_data.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/reusable_components/checklist_box.dart';
import 'package:instantplus/reusable_components/faq_accordion.dart';
import 'package:instantplus/reusable_components/page_banner.dart';
import 'package:instantplus/reusable_components/purchase_card.dart';
import 'package:instantplus/reusable_components/segment_tabs.dart';
import 'package:instantplus/reusable_components/site_scaffold.dart';
import 'package:instantplus/reusable_components/testimonial_card.dart';
import 'package:instantplus/reusable_components/text_widget.dart';
import 'package:provider/provider.dart';

class CourseDetailsScreen extends StatefulWidget {
  final int courseId;

  const CourseDetailsScreen({super.key, required this.courseId});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final course = DemoData.courseById(widget.courseId);
    final cart = context.read<CartProvider>();

    return SiteScaffold(
      title: 'تفاصيل الكورس',
      showBack: true,
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          PageBanner(
            title: course.title,
            subtitle: course.description,
            image: AssetsResource.bgHero,
            badges: [course.duration, '2,100 طالب', course.level],
          ),
          SizedBox(height: 16.h),
          PurchaseCard(
            title: 'سجل في الكورس الآن',
            price: course.price,
            oldPrice: course.oldPrice,
            discount: 'وفر 15%',
            primaryAction: 'سجل الآن',
            secondaryAction: 'اضف للسلة',
            features: DemoData.courseFeatures,
            image: course.image,
            onPrimary: () => cart.addCourse(course),
            onSecondary: () => cart.addCourse(course),
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
              text: '6 أقسام · 12 درس · 12 ساعة إجمالاً',
              textStyle: getSemiBoldStyle(
                fontSize: FontSize.kindaSmall,
                color: ColorsManager.primary,
              ),
            ),
            SizedBox(height: 12.h),
            ...DemoData.courseSections.map(
              (section) => Container(
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: ColorsManager.basicBorder),
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: TextWidget(
                      text: section.title,
                      textStyle: getSemiBoldStyle(
                        fontSize: FontSize.kindaSmall,
                      ),
                    ),
                    subtitle: TextWidget(
                      text: '${section.lessonsCount} دروس',
                      textStyle: getRegularStyle(
                        fontSize: FontSize.tinyText,
                        color: ColorsManager.hintColor,
                      ),
                    ),
                    children: section.lessons
                        .map(
                          (lesson) => ListTile(
                            dense: true,
                            leading: Icon(Icons.play_circle_outline,
                                color: ColorsManager.primary, size: 20.sp),
                            title: TextWidget(
                              text: lesson,
                              textStyle: getRegularStyle(
                                fontSize: FontSize.kindaSmall,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
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
