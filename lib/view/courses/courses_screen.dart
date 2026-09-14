import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/demo_data.dart';
import 'package:instantplus/resources/strings_resources.dart';
import 'package:instantplus/reusable_components/course_card.dart';
import 'package:instantplus/reusable_components/page_banner.dart';
import 'package:instantplus/reusable_components/segment_tabs.dart';
import 'package:instantplus/reusable_components/site_scaffold.dart';

class CoursesScreen extends StatefulWidget {
  final String? initialTab;

  const CoursesScreen({super.key, this.initialTab});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  late int _selectedTab;

  @override
  void initState() {
    super.initState();
    final tabs = DemoData.libraryTabs;
    final index = widget.initialTab == null
        ? 0
        : tabs.indexWhere((t) => t.contains(widget.initialTab!));
    _selectedTab = index >= 0 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      title: StringsManager.allCourses,
      showBack: true,
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          const PageBanner(
            title: 'استكشف مكتبتنا التعليمية',
            subtitle: 'كورسات عملية بأحدث التقنيات ومسارات واضحة لسوق العمل',
            badges: ['30+ كورس', 'مدربون محترفون'],
          ),
          SizedBox(height: 16.h),
          SegmentTabs(
            tabs: DemoData.libraryTabs,
            selectedIndex: _selectedTab,
            onChanged: (i) => setState(() => _selectedTab = i),
          ),
          SizedBox(height: 16.h),
          ...DemoData.courses.map(
            (course) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: CourseCard(course: course, width: null),
            ),
          ),
        ],
      ),
    );
  }
}
